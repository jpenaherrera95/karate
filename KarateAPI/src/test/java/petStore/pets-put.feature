Feature: Metodo PUT para un Pet

  Scenario: Actualizar la informacion para una pet
    Given url baseUrl + petsPath
    And header Accept = 'application/json'
    And request read('data/petsPut.json')
    When method PUT
    Then status 200
    And match $ contains { id: '#notnull'}
    And match response ==
    """
    {
      id: '#number',
      category: {
        id: '#number',
        name: '#string'
      },
      "name": '#string',
      "photoUrls": [
        '#string'
        ],
      "tags": [
      {
        id: '#number',
        name: '#string'
      }
      ],
      status: '#string'
    }
    """