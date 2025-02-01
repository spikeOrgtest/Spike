import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
    // 상품별 이자율을 가져오는 메소드 추가
    Product findById(Long id);
} 