package principal_orden.Services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import principal_orden.DTO.Producto;
import principal_orden.Models.Orden;
import principal_orden.Repositories.OrdenRepository;

import java.util.List;

@Service
public class OrdenService {
    @Autowired
    private OrdenRepository ordenRepository;
    @Autowired
    private RestTemplate restTemplate;
    private static final Logger logger = LoggerFactory.getLogger(OrdenService.class);
    @CircuitBreaker(name = "productServiceCB", fallbackMethod = "fallbackGetProduct")
    public Orden realizarOrden(Orden order) {

        // Llamada al microservicio de productos
        String productUrl = "http://localhost:8081/producto/" + order.getProductoId();
        Producto product = restTemplate.getForObject(productUrl, Producto.class);
        if (product == null) {
            logger.error("Error al rescatar el producto " +  order.getProductoId());
            throw new RuntimeException("Producto no encontrado");
        }
        order.setTotal(product.getPrecio() * order.getQuantity());
        return ordenRepository.save(order);
    }
    public List<Orden> getAllOrdenes() {
        logger.debug("getAllOrdenes");
        logger.info("Retornando todas las ordenes");
        return ordenRepository.findAll();
    }
    public Orden fallbackGetProduct(Orden o, Throwable throwable) {
        System.out.println("Fallback originado por: " + throwable.getMessage());
        // Aquí incluso podría lanzar una excepción específica
        Orden fallbackOrder = new Orden();
        fallbackOrder.setProductoId(o.getProductoId());
        fallbackOrder.setQuantity(o.getQuantity());
        fallbackOrder.setTotal(-1.0); // o algún valor por defecto
        return fallbackOrder;
    }
}
