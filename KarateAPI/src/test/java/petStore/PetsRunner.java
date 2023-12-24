package petStore;

import com.intuit.karate.junit5.Karate;

public class PetsRunner {
    @Karate.Test
    Karate testPets(){
        return Karate.run("pets-crud").relativeTo(getClass());
    }
}
