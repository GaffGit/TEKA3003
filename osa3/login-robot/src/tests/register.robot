*** Settings ***
Resource  resource.robot



*** Test Cases ***
Register With Valid Username And Password
    Input Create Command
    Input Credentials  kalle  kalle123
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Create User  kalle  kalle123
    Input Create Command
    Input Credentials  kalle  kalle321
    Output Should Contain  User with username kalle already exists

Register With Too Short Username And Valid Password
    Input Create Command
    Input Credentials  ka  kalle123
    Output Should Contain  Username must be at least 3 characters (a-z)

Register With Enough Long But Invalid Username And Valid Password
    Input Create Command 
    Input Credentials  2343245  kalle123
    Output Should Contain  Username must be at least 3 characters (a-z)

Register With Valid Username And Too Short Password
    Input Create Command 
    Input Credentials  kalle  kalle
    Output Should Contain  Password must be at least 8 characters long

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Create Command
    Input Credentials  kalle  kalleolikinkalle
    Output Should Contain  Password must not consist only of letters
