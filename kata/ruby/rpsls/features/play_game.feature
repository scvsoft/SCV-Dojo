Feature: Play individual games
  
  Scenario Outline: Player choose a play, Computer choose a play.
    Given I am on game page
    When I select <player_select>
    And computer select <computer_select>
    Then I shuld see <result>

    Scenarios: lets play rpsls
    | player_select | computer_select | result     |
    |     rock      |     rock        |  Tie!      |
    |     rock      |     paper       |  You Lose! |
    |     rock      |     scissor     |  You Win!  |
    |     rock      |     lizzard     |  You Win!  |
    |     rock      |     Spock       |  You Lose! |
    |     paper     |     rock        |  You Win!  |
    |     paper     |     paper       |  Tie!      |
    |     paper     |     scissor     |  You Win!  |
    |     paper     |     lizzard     |  You Lose! |
    |     paper     |     spock       |  You Win!  |
    |     scissor   |     rock        |  You Lose! |
    |     scissor   |     paper       |  You Win!  |
    |     scissor   |     scissor     |  Tie!      |
    |     scissor   |     lizzard     |  You Win!  |
    |     scissor   |     spock       |  You Lose! |
    |     lizzard   |     rock        |  You Lose! |
    |     lizzard   |     paper       |  You Win!  |
    |     lizzard   |     scissor     |  You Lose! |
    |     lizzard   |     lizzard     |  Tie!      |
    |     lizzard   |     spock       |  You Lose! |
    |     spock     |     rock        |  You Win!  |
    |     spock     |     paper       |  You Lose! |
    |     spock     |     scissor     |  You Win!  |
    |     spock     |     lizzard     |  You Lose! |
    |     spock     |     spock       |  Tie!      |
