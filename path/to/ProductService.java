import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public double getInterestRate(Long productId) {
        Product product = productRepository.findById(productId);
        return product != null ? product.getInterestRate() : 0.0;
    }
} 