@delete_product
Feature: Products
  As a user
  I can log into the Agrian website
  so that I can create custom products

  Background:
    #Given I can access Agrian's Website, via NextGen
    When I login as test_engineering@agrian.com with password 12345678, through the API
    And I go directly to feature Custom Products

  Scenario: I create a Fertilizer product with integer values for nutrients
    And I begin to create a new Fertilizer product
    And random integer values are generated
    And a Fertilizer product is created with the random nutrient values
    And I save the product
    And the product Materials information is viewed
    Then I check the nutrient values for the correct value

  Scenario: I create a Fertilizer product with decimal values for nutrients
    And I begin to create a new Fertilizer product
    And random decimal values are generated
    And a Fertilizer product is created with the random nutrient values
    And I save the product
    And the product Materials information is viewed
    Then I check the nutrient values for the correct value

  Scenario: When changing fertilizer physical state to a liquid
    And I begin to create a new Fertilizer product
    And I begin to add a new Material
    And random nutrient values are given to a fertilizer material
    And I select Emulsion for these dropdown fields: Physical State
    Then I expect these fields to be required: Density,Density Unit,Density Unit Per

  Scenario: When changing fertilizer physical state to a gas
    And I begin to create a new Fertilizer product
    And I begin to add a new Material
    And random nutrient values are given to a fertilizer material
    And I select Smoke for these dropdown fields: Physical State
    Then I expect these fields to be required: Density,Density Unit,Density Unit Per

  Scenario: A custom fertilizer product can be made by starting with another product
    And I begin to create a new Fertilizer product by starting with Urea
    And I fill in these text fields: Name with a name
    And I begin to add a new Material
    And I check what values are in these fields: Name,Classifications,Physical State,Product Type,Density
    And I check what values are in these fields: Density Unit,Density Unit Per,N,CCE
    Then I compare the data to what I expect for Urea
    And I save the product
    And the product Materials information is viewed
    Then I check these fields for the appropriate data: Name,Classifications,Physical State,Product Type,Density
    Then I check these fields for the appropriate data: Density Unit,Density Unit Per,N,CCE

  Scenario: All the general information can be populated and saved for a new chemical product
    And there is an existing ticket DEV-11600 that is causing this test to fail
    And I begin to create a new Chemical product
    And random integer values are generated
    And I fill in these text fields: Name,Manufacturer,Code with a name
    And I fill in these text fields: Size,Weight,Coverage,Rate,Price ($) with a number
    And I select the first option for these dropdown fields: Application,Application Per,Total Units
    And I select the first option for these dropdown fields: Class,Sub-Class,Size Unit,Weight Unit
    And I select the first option for these dropdown fields: Coverage Area,Rate Unit,Rate Per,Unit
    And I save the product
    And the product information is viewed
    Then I check these fields for the appropriate data: Name,Manufacturer,Code
    Then I check these fields for the appropriate data: Size,Weight,Coverage,Rate,Price ($)
    Then I check these fields for the appropriate data: Application,Application Per,Total Units
    Then I check these fields for the appropriate data: Class,Sub-Class,Size Unit,Weight Unit
    Then I check these fields for the appropriate data: Coverage Area,Rate Unit,Rate Per,Unit

  Scenario: A material can be made for a new custom chemical product
    And I begin to create a new Chemical product
    And random integer values are generated
    And I fill in these text fields: Name with a name
    And I begin to add a new Material
    And I select the first option for these dropdown fields: Formulation,Mode of Action,Classifications
    And I select the first option for these dropdown fields: Physical State,Density Unit,Density Unit Per,Signal Word
    And I fill in these text fields: Density with a number
    And I begin to add a new Active Ingredient
    And I select the first option for these dropdown fields: Ingredient
    And I fill in these text fields: Percentage,Amount with a number
    And I select the first option for these dropdown fields: Unit,Unit Per
    And I save the product
    And the product Materials information is viewed
    Then I check these fields for the appropriate data: Formulation,Mode of Action,Classifications
    Then I check these fields for the appropriate data: Physical State,Density Unit,Density Unit Per,Signal Word
    Then I check these fields for the appropriate data: Density,Percentage,Amount,Name

  Scenario: A usage role can be made for a new custom chemical product
    And there is an existing ticket DEV-14222 that is causing this test to fail
    And I begin to create a new Chemical product
    And random integer values are generated
    And I fill in these text fields: Name with a name
    And I begin to add a new Material
    And I begin to add a new Usage Rule
    And I select the first option for these dropdown fields: Commodities,Application Methods,Products
    And I select the first option for these dropdown fields: Unit,Per Unit
    And I fill in these text fields: Max Rate Per Use,Max Rate Per Season,Min Dilution Amount,Max Dilution Amount with a number
    And I fill in these text fields: Hours Until Entry,Days Until Harvest with a number
    And I fill in these text fields: Treatments Per Season,Days Between Treatments with a number
    And I save the product Usage Rule
    And I save the product
    And the product Usage Rules information is viewed
    Then I check these fields for the appropriate data: Commodities,Application Methods,Products
    Then I check these fields for the appropriate data: Unit,Per Unit
    Then I check these fields for the appropriate data: Max Rate Per Use,Max Rate Per Season,Min Dilution Amount,Max Dilution Amount
    Then I check these fields for the appropriate data: Hours Until Entry,Days Until Harvest
    Then I check these fields for the appropriate data: Treatments Per Season,Days Between Treatments

  Scenario: A custom Chemical product can be created by starting with another product
    And I begin to create a new Chemical product by starting with Prowl(R) 3.3 EC Herbicide
    And I fill in these text fields: Name with a name
    And I begin to add a new Material
    And I check what values are in these fields: Name,Formulation,Mode of Action,Classifications,Physical State,Product Type
    And I check what values are in these fields: Density,Density Unit,Density Unit Per,Signal Word,Source,Number,Ingredient
    And I check what values are in these fields: Percentage
    Then I compare the data to what I expect for Prowl(R) 3.3 EC Herbicide
    And I save the product
    And the product Materials information is viewed
    Then I check these fields for the appropriate data: Name,Formulation,Mode of Action,Classifications,Physical State,Product Type
    Then I check these fields for the appropriate data: Density,Density Unit,Density Unit Per,Signal Word,Source,Number,Ingredient
    Then I check these fields for the appropriate data: Percentage

  Scenario: All the general information can be populated and saved for a new seed product
    And I begin to create a new Seed product
    And random integer values are generated
    And I fill in these text fields: Name,Manufacturer with a name
    And I fill in these text fields: Size,Weight,Price ($) with a number
    And I select Alfalfa for these dropdown fields: Commodity
    And I select the first option for these dropdown fields: Variety,Class,Sub-Class,Size Unit,Weight Unit
    And I select Cubic Meters for these dropdown fields: Unit
    And I save the product
    And the product information is viewed
    Then I check these fields for the appropriate data: Name,Manufacturer,Code
    Then I check these fields for the appropriate data: Size,Weight,Price ($)
    Then I check these fields for the appropriate data: Commodity,Variety,Class,Sub-Class,Size Unit,Weight Unit,Unit

  Scenario: A material can be made for a new seed product
    And I begin to create a new Seed product
    And random integer values are generated
    And I fill in these text fields: Name with a name
    And I select Alfalfa for these dropdown fields: Commodity
    And I select 3210 for these dropdown fields: Variety
    And I begin to add a new Material
    And I begin to add a new Active Ingredient
    And I select the first option for these dropdown fields: Formulation,Mode of Action,Classifications,Physical State
    And I select the first option for these dropdown fields: Density Unit,Density Unit Per,Signal Word,Ingredient
    And I fill in these text fields: Density,Percentage with a number
    And I fill in these text fields: Amount with a number
    And I select the first option for these dropdown fields: Unit,Unit Per
    And I save the product
    And the product Materials information is viewed
    Then I check these fields for the appropriate data: Name,Formulation,Mode of Action,Classifications,Physical State
    Then I check these fields for the appropriate data: Density,Density Unit,Density Unit Per,Signal Word,Ingredient
    Then I check these fields for the appropriate data: Percentage,Amount,Unit,Unit Per

  Scenario: All the general information can be populated and saved for a new service product
    And I begin to create a new Service product
    And random integer values are generated
    And I fill in these text fields: Name,Manufacturer,Code with a name
    And I select the first option for these dropdown fields: Application,Application Per,Total Units,Class,Sub-Class
    And I select the first option for these dropdown fields: Coverage Area,Rate Unit,Rate Per,Unit
    And I fill in these text fields: Coverage,Rate,Price ($) with a number
    And I save the product
    And the product information is viewed
    Then I check these fields for the appropriate data: Name,Manufacturer,Code
    Then I check these fields for the appropriate data: Application,Application Per,Total Units,Class,Sub-Class
    Then I check these fields for the appropriate data: Coverage Area,Rate Unit,Rate Per,Unit
    Then I check these fields for the appropriate data: Coverage,Rate,Price ($)

  Scenario: All the general information can be populated and saved for a new water product
    And there is an existing ticket DEV-11600 that is causing this test to fail
    And I begin to create a new Water product
    And random integer values are generated
    And I fill in these text fields: Name,Manufacturer,Code with a name
    And I fill in these text fields: Size,Weight,Coverage,Rate,Price ($) with a number
    And I select the first option for these dropdown fields: Application,Application Per,Total Units
    And I select the first option for these dropdown fields: Class,Sub-Class,Size Unit,Weight Unit
    And I select the first option for these dropdown fields: Coverage Area,Rate Unit,Rate Per,Unit
    And I save the product
    And the product information is viewed
    Then I check these fields for the appropriate data: Name,Manufacturer,Code,Size,Weight,Coverate,Rate,Price ($)
    Then I check these fields for the appropriate data: Application,Application Per,Total Units
    Then I check these fields for the appropriate data: Class,Sub-Class,Size Unit,Weight Unit
    Then I check these fields for the appropriate data: Coverage Area,Rate Unit,Rate Per,Unit

  Scenario: A material can be made for a new custom water product
    And I begin to create a new Water product
    And random integer values are generated
    And I fill in these text fields: Name with a name
    And I begin to add a new Material
    And I select the first option for these dropdown fields: Formulation,Mode of Action,Classifications
    And I select the first option for these dropdown fields: Physical State,Density Unit,Density Unit Per,Signal Word
    And I fill in these text fields: Density with a number
    And I begin to add a new Active Ingredient
    And I select the first option for these dropdown fields: Ingredient
    And I fill in these text fields: Percentage,Amount with a number
    And I select the first option for these dropdown fields: Unit,Unit Per
    And I save the product
    And the product Materials information is viewed
    Then I check these fields for the appropriate data: Formulation,Mode of Action,Classifications
    Then I check these fields for the appropriate data: Physical State,Density Unit,Density Unit Per,Signal Word
    Then I check these fields for the appropriate data: Density,Percentage,Amount,Name

  Scenario: A usage role can be made for a new custom water product
    And there is an existing ticket DEV-14222 that is causing this test to fail
    And I begin to create a new Water product
    And random integer values are generated
    And I fill in these text fields: Name with a name
    And I begin to add a new Material
    And I begin to add a new Usage Rule
    And I select the first option for these dropdown fields: Commodities,Application Methods,Products
    And I select the first option for these dropdown fields: Unit,Per Unit
    And I fill in these text fields: Max Rate Per Use,Max Rate Per Season,Min Dilution Amount,Max Dilution Amount with a number
    And I fill in these text fields: Hours Until Entry,Days Until Harvest with a number
    And I fill in these text fields: Treatments Per Season,Days Between Treatments with a number
    And I save the product Usage Rule
    And I save the product
    And the product Usage Rules information is viewed
    Then I check these fields for the appropriate data: Commodities,Application Methods,Products
    Then I check these fields for the appropriate data: Unit,Per Unit
    Then I check these fields for the appropriate data: Max Rate Per Use,Max Rate Per Season,Min Dilution Amount,Max Dilution Amount
    Then I check these fields for the appropriate data: Hours Until Entry,Days Until Harvest
    Then I check these fields for the appropriate data: Treatments Per Season,Days Between Treatments

  Scenario: All the general information can be populated and saved for a new other product
    And there is an existing ticket DEV-11600 that is causing this test to fail
    And I begin to create a new Other product
    And random integer values are generated
    And I fill in these text fields: Name,Manufacturer,Code with a name
    And I fill in these text fields: Size,Weight,Coverage,Rate,Price ($) with a number
    And I select the first option for these dropdown fields: Application,Application Per,Total Units
    And I select the first option for these dropdown fields: Class,Sub-Class,Size Unit,Weight Unit
    And I select the first option for these dropdown fields: Coverage Area,Rate Unit,Rate Per,Unit
    And I save the product
    And the product information is viewed
    Then I check these fields for the appropriate data: Name,Manufacturer,Code,Size,Weight,Coverate,Rate,Price ($)
    Then I check these fields for the appropriate data: Application,Application Per,Total Units
    Then I check these fields for the appropriate data: Class,Sub-Class,Size Unit,Weight Unit
    Then I check these fields for the appropriate data: Coverage Area,Rate Unit,Rate Per,Unit

  Scenario: A material can be made for a new custom other product
    And I begin to create a new Other product
    And random integer values are generated
    And I fill in these text fields: Name with a name
    And I begin to add a new Material
    And I select the first option for these dropdown fields: Formulation,Mode of Action,Classifications
    And I select the first option for these dropdown fields: Physical State,Density Unit,Density Unit Per,Signal Word
    And I fill in these text fields: Density with a number
    And I begin to add a new Active Ingredient
    And I select the first option for these dropdown fields: Ingredient
    And I fill in these text fields: Percentage,Amount with a number
    And I select the first option for these dropdown fields: Unit,Unit Per
    And I save the product
    And the product Materials information is viewed
    Then I check these fields for the appropriate data: Formulation,Mode of Action,Classifications
    Then I check these fields for the appropriate data: Physical State,Density Unit,Density Unit Per,Signal Word
    Then I check these fields for the appropriate data: Density,Percentage,Amount,Name

  Scenario: A usage role can be made for a new custom other product
    And there is an existing ticket DEV-14222 that is causing this test to fail
    And I begin to create a new Other product
    And random integer values are generated
    And I fill in these text fields: Name with a name
    And I begin to add a new Material
    And I begin to add a new Usage Rule
    And I select the first option for these dropdown fields: Commodities,Application Methods,Products
    And I select the first option for these dropdown fields: Unit,Per Unit
    And I fill in these text fields: Max Rate Per Use,Max Rate Per Season,Min Dilution Amount,Max Dilution Amount with a number
    And I fill in these text fields: Hours Until Entry,Days Until Harvest with a number
    And I fill in these text fields: Treatments Per Season,Days Between Treatments with a number
    And I save the product Usage Rule
    And I save the product
    And the product Usage Rules information is viewed
    Then I check these fields for the appropriate data: Commodities,Application Methods,Products
    Then I check these fields for the appropriate data: Unit,Per Unit
    Then I check these fields for the appropriate data: Max Rate Per Use,Max Rate Per Season,Min Dilution Amount,Max Dilution Amount
    Then I check these fields for the appropriate data: Hours Until Entry,Days Until Harvest
    Then I check these fields for the appropriate data: Treatments Per Season,Days Between Treatments