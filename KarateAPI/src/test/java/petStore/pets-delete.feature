Feature: Metodo DELETE para un Pet

  Scenario: Eliminar una Pet
    Given url baseUrl + petsPath + '/' + petId
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