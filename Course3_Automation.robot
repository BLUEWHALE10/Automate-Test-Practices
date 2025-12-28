*** Settings ***
Library    SeleniumLibrary



*** Variables ***
@{abc}    a    b    c
@{xyz}    x    y    z
@{NUM}    1    2    3    4    5



*** Test Cases ***
#-----------------------------Simple For Loop--------------------------------
Simple For loop
    FOR    ${n}    IN    dog    pig    cat
        Log To Console    ${n}
    END
    
Example IN List
    @{list1}    Create List    cat    dog    pig
    FOR    ${n}    IN    @{list1}
        Log To Console    ${\n}${n}
    END
    

#-----------------------------Using several loop variables--------------------

Several loop
    FOR    ${index}    ${englsih}    ${thai}    IN    
    ...    1            one         หนึ่ง    
    ...    2            two         สอง
        Log To Console    ${\n}${index} ${englsih} ${thai}
    END


Two Several List
    @{list1}    Create List    cat    dog    pig    bat    cow    snake
    FOR    ${n}    ${m}    IN    @{list1}
        Log To Console    ${\n}${n} ${m}
    END


#-----------------------------loop RANGE--------------------


FOR Range Case
    FOR    ${n}    IN RANGE    5
        Log To Console    ${n}
    END

FOR Range Case START END
    FOR    ${n}    IN RANGE    5    11
        Log To Console    ${n}
    END

FOR Range Case START END INC
    FOR    ${n}    IN RANGE    5    25    5
        Log To Console    ${n}
    END


#-----------------------------loop ZIP--------------------


loop in zip

    FOR    ${n1}    ${n2}    ${n3}    IN ZIP    ${abc}    ${xyz}    ${NUM}

        Log To Console    ${\n}${n1} ${n2} ${n3} 

    END

    FOR    ${n1}    IN ZIP    ${abc}    ${xyz}    ${NUM}
        Log To Console    ${\n}${n1}[0] ${n1}[1] ${n1}[2] 
    END


#-----------------------------Exitng loop-------------------


Exitng loop
    FOR    ${n}    IN RANGE    0    10
        Log To Console    ${n}
        Run Keyword If    '${n}' == '2'    Exit For Loop
        Exit For Loop If    '${n}' == '3' 
    END

#-----------------------------Countinuing loop-------------------

Continuing loop
    FOR    ${index}    IN RANGE    0    10
        IF    ${index} == 5
            Log To Console    'Continue Trig'
            Continue For Loop
        END
        # IF index = 5 skip this loop
        Log To Console    ${index} 
    END



#-----------------------------IF-ELSE----------------------------
IF ELSE
    FOR    ${i}    IN ZIP    ${abc}    ${NUM}
        IF    ${i}[1] == 2
            
           Log To Console    'Hi There'
            
        END
        
        IF    '${i}[0]' == 'a'
            
           Log To Console    'Hi There'
            
        END
    
    END









