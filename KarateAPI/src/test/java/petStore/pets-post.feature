Feature: Metodo POST para un Pet

  @setup
  Scenario:
    * def pet = read('pets.json')

  Scenario: Crear una nueva Pet
    Given url baseUrl + petsPath
    And header Accept = 'application/json'
    And request read('data/petsPost.json')
    When method POST
    Then status 200
    And match $ contains { id: '#(petId)'}
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