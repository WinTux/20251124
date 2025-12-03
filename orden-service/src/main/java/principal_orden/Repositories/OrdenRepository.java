package principal_orden.Repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import principal_orden.Models.Orden;

public interface OrdenRepository  extends JpaRepository<Orden,Long> {
    List<Orden> findByTotal(Double total);
}
