Feature: Metodo DELETE para un Pet

  Background:
    * def petLocalId = 5557
    * def data = call read('pets-dataGeneration.feature') { id: '#(petLocalId)', nombre: 'Pancho', raza: 'Castellano'}

  Scenario: Eliminar una Pet
    Given url baseUrl + petsPath + '/' + petLocalId
    And header Accept = 'application/json'
    And header api_key = appSecret
    When method DELETE
    Then status 200
    And match $ contains { code: '#notnull'}
    And match response ==
    """
    {
      code: '#number',
      type: '#string',
      message: '#string'
    }
    """