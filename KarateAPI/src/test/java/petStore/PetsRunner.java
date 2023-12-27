package petStore;

import com.intuit.karate.junit5.Karate;

public class PetsRunner {
    @Karate.Test
    Karate testCrud(){
        return Karate.run("classpath:petStore/pets-crud.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testDelete(){
        return Karate.run("classpath:petStore/pets-delete.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testGet(){
        return Karate.run("classpath:petStore/pets-get.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testPost(){
        return Karate.run("classpath:petStore/pets-post.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testPut(){
        return Karate.run("classpath:petStore/pets-put.feature").relativeTo(getClass());
    }
}
