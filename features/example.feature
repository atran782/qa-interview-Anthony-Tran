Feature: An Example Feature

	Background: Go to www.MyRapName.com before every scenario
		Given I am on the homepage of www.MyRapName.com

	Scenario: The input fields exist 
		Then I validate the input fields are present
			|First Name:	|
			|Last Initial:	|

	Scenario Outline: A negative scenario using the <Gender> input field
		When I click suggest "<Gender>" rap name
		Then I am asked for a first name
		
		Examples:
			|Gender	|
			|male	|
			|female	|
		
	Scenario Outline: Input data into the <Field_Type> field
		Then I should be able to enter in a "<Field_Type>"
		
		Examples:
			|Field_Type		|
			|First Name		|
			|Last Initial	|
			
	Scenario: Submit a name for a male with a nickname and validate a new name has been prepended to the list
		When I enter in a "first name" 
		And I "enable" the use nickname box
		And I click suggest "male" rap name
		Then I see "one" new rap name
		
	Scenario: Submit twice for a female with a last initial and validate that a new name has been prepended to the list
		When I enter in a "first name"
		And I enter in a "last initial"
		And I "disable" the use nickname box
		And I click suggest "female" rap name
		And I click suggest "female" rap name
		Then I see "two" new rap name		