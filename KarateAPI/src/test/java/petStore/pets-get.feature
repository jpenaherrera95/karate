Feature: Metodos CRUD de Pets APIs

  @setup
  Scenario:
    * def pet = read('data/pets.json')
    * def data = call read('pets-dataGeneration.feature') { id: '#(pet)', nombre: 'Nacho', raza: 'Schnauzer'}

  Scenario Outline: Obtener mascota
    Given url baseUrl
    And path petsPath + petId
    And header Accept = 'application/json'
    When method GET
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

    Examples:
    | karate.setup().pet |