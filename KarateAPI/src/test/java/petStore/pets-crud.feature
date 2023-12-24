Feature: Metodos CRUD de Pets APIs

  Background:
    * def petLocalId = 5556

  Scenario: Creacion de una nueva mascota
    Given url baseUrl + petsPath
    And header Accept = 'application/json'
    And request read('data/petsCrudPost.json')
    When method POST
    Then status 200
    And match $ contains { id: '#(petLocalId)'}
    And match $ contains { id: '#notnull'}

  Scenario: Consultar mascota creada
    Given url baseUrl + petsPath + petLocalId
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And match $ contains { id: '#(petLocalId)'}
    And match $ contains { id: '#notnull'}

  Scenario: Actualizar informacion de la mascota
    Given url baseUrl + petsPath
    And header Accept = 'application/json'
    And request read('data/petsCrudPut.json')
    When method PUT
    Then status 200
    And match $ contains { id: '#(petLocalId)'}
    And match $ contains { id: '#notnull'}

  Scenario: Confirmar actualizacion
    Given url baseUrl + petsPath + petLocalId
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And match $ contains { id: '#(petLocalId)'}
    And match $ contains { id: '#notnull'}
    And match $.category.name == 'Mia Mia'

  Scenario: Eliminar mascota
    Given url baseUrl + petsPath + '/' + petLocalId
    And header Accept = 'application/json'
    And header api_key = appSecret
    When method DELETE
    Then status 200
    And match $ contains { code: '#notnull'}