Feature: Metodo POST para un Pet

  Scenario: Crear una nueva Pet
    Given url baseUrl + petsPath
    And header Accept = 'application/json'
    And request
    """
    {
      "id": '#(id)',
      "category": {
      "id": '#(id)',
      "name": '#(nombre)'
    },
      "name": "doggie",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": '#(id)',
          "name": '#(raza)'
        }
      ],
      "status": "available"
    }
    """
    When method POST
    Then status 200
    And match $ contains { id: '#(id)'}
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