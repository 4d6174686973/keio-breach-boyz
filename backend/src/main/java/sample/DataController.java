package sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.scalar.db.exception.transaction.TransactionException;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api/data")
public class DataController {

    @Autowired
    private Sample sample;

    @PostMapping("/load")
    public ResponseEntity<String> loadInitialData() {
        try {
            sample.loadInitialData();
            return ResponseEntity.ok("Initial data loaded successfully");
        } catch (TransactionException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred: " + e.getMessage());
        }
    }
}
