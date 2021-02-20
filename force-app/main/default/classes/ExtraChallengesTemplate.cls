/////////////////////////////////////////////////////////////////
//
// Name: Project 0 Bravo Extra Challenges
// Author: Name (Email)
// Date: 00/00/0000
//
/////////////////////////////////////////////////////////////////

public with sharing class ExtraChallengesTemplate {

    
    /*  questionMarks declares the str parameter, which can have numbers, letters, and question marks.
        It will then check str to see if there are exactly 3 question marks between every pair of two numbers that add up to 10.
        If there are, questionMarks returns true. In any other case (including the case where str doesn't contain any two numbers that sum to 10),
        questionMarks will return false.

        For example, when given the String "arrb6???4???b5???ef5", questionMarks returns true because there are 3 question marks between 6 and 4 and
        another 3 question marks between 5 and 5 (and both pairs of numbers sum to 10).

        Other examples:
            str = "aa6?9" => questionMarks returns false
            str = "a?7??s?3r1?????5" => questionMarks returns true because there's at least one pair of numbers that sum to 10 (7 and 3) and 3
                question marks between those numbers
   */
    public static Boolean questionMarks(String str) {
        //Add all the indices of numbers to a list, then check which of those numbers add to 10
        //then for the ones that do go back and confirm they have three ? between them

        //this variable will keep tracl of if at least one pairing is found with correct questions marks
        Boolean onePair = false;


        //first step is to add the individual characters to a list because apex sucks at string parsing
        List<String> charList = new List<String>();
        for (Integer i = 0; i < str.length(); i++)
        {
            charList.add(str.substring(i, i + 1));
        }

        //ExtraChallengesTemplate.printArrayString(charList);

        //now we keep track of all the indices of the numbers
        Integer i = 0;
        List<Integer> indexList = new List<Integer>();
        for (String currChar : charList)
        {
            if (currChar.isNumeric())
            {
                indexList.add(i);
            }
            i++;
        }

        //P0B.printArray(indexList);
        //now we need to check which ones of those add up to 10
        //and if they do we will then use them in a search for three question marks
        for(i = 0; i < indexList.size() - 1; i++)
        {
            if (Integer.valueof(charList[indexList[i]]) + Integer.valueof(charList[indexList[i + 1]]) == 10)
            {
                //start counting question marks
                Integer numQuestions = 0;
                //System.debug(charList[indexList[i]] + ' ' + charList[indexList[i + 1]]);
                for (Integer j = indexList[i]; j < indexList[i + 1]; j++)
                {
                    if (charList[j] == '?')
                    {
                        numQuestions++;
                    }
                }

                if (numQuestions != 3)
                {
                    return false;
                }
                else {
                    onePair = true;
                }
            }
        }

        return onePair;
    }
     

    /*
        multipleCounter returns the number of multiples of the Integer n that exist in the inclusive range [firstNum, secondNum].
        You can assume that firstNum < secondNum in all cases.

        Examples:
            firstNum = 1, secondNum = 6, n = 5 => multipleCounter returns 1 because there is one multiple of 5 in the range [1, 6] (which is 5)
            firstNum = 2, secondNum = 12, n = 2 => multipleCounter returns 6 because there are 6 multiples of 2 in the range [2, 12] 
                (which are 2, 4, 6, 8, 10, and 12)
    */
    public static Integer multipleCounter(Integer firstNum, Integer secondNum, Integer n) {
        //chose to make it a set so each multiple would only appear once
        // then i reread the problem and it actually doesnt matter beacuse each will
        //appear only once no matter what
        Set<Integer> multSet = new Set<Integer>();

        //goes from the first number to the last and tries to get a modulo of 0
        for (Integer i = firstNum; firstNum <= secondNum; firstNum++)
        {
            //if the remainder is 0 then it is a multiple and add it
            if (math.mod(firstNum, n) == 0)
            {
                multSet.add(firstNum);
            }
        }

        return multSet.size();
    }
    
    /*
        palindromicity declares a parameter str and returns the degree of palindromicity for that string - i.e. the smallest possible number
        of palindromes needed to construct the string.

        Examples:
            str = "a" => palindromicity returns 1 because "a" backwards is "a"
            str = "b3b" => palindromicity returns 1 because "b3b" backwards is "b3b"

            str = "ty" => palindromicity returns 2 because str can be broken into two 1 letter palindromes ("t" and "y")
            str = "343hmh" => palindromicity returns 2 because str can be broken into two 3 letter palindromes ("343" and "hmh")

            str = "iotoihannahracecar" => palindromicity returns 3 because str can be broken into 3 palindromes ("iotoi", "hannah", and "racecar")
        */
    //not the most elegant solution, could maybe simplify into just 2 cases instead of my 5
    //works for most cases (given tests) but definitley not correct
    //would be interested to see the optimal solution
    public static Integer palindromicity(String str) {

        Integer numPalindromes = 0;
        //first step is to add the individual characters to a list because apex sucks at string parsing
        //again
        List<String> charList = new List<String>();
        for (Integer i = 0; i < str.length(); i++)
        {
            charList.add(str.substring(i, i + 1));
        }
    
    //as we find palindromes they are removed from the list
    while (charList.size() != 0){   

        Boolean palFound = false;

        printArrayString(charList);
        System.debug(numPalindromes);

        //System.debug('odd palindromes');
        //next we start and look through the string for a pivot point
        //for odd palindromes aka - racecar
        if (charList.size() >= 5){
        for(Integer i = 1; i < charList.size() - 1; i++)
        {
            //this is for cases with a lot of the same letter such as 'aaaaa'
            // if ((charList[i-1] == charList[i]) && (charList[i + 1] == charList[i]))
            // {
            //     charList.remove(i);
            //     charList.remove(i);
            //     charList.remove(i - 1);
            //     break;
            // }
            //finding the 'pivot point' for odd palindromes and removing it to become an even one
            //such as the e in racecar
            if ((charList[i - 1] == charList[i+1]))
            {
                charList.remove(i);
                break;
            }
        }
            
        }

         if(charList.size() >= 4)
        {
        //System.debug('even palindromes');
        //next we start and look for the 'mirror point' - so the first n in 'hannah'
        //even palindromes aka - Hannah
        for(Integer i = 0; i < charList.size() - 1; i++)
        {
            //System.debug(i);
            //System.debug(charList.size());
            //this is our base case and then we can work backwords

            while ((charList[i] == charList[i+1]))
            {
                charList.remove(i);
                
                //will actually remove i + 1
                charList.remove(i);
                palFound = true;
                
                   
                if(i == 0){
                    //if palindrome was at start
                    numPalindromes++;
                    break;
                }

                else if(i >= charList.size()){
                    //if palindrome was at the end
                    numPalindromes++;
                    break;
                }
                //System.debug(charList[i] + ' ' + charList[i +1]);


                i--;
                //this is to keep the index at the same relative place
            }
        }
        if(!palFound){
            numPalindromes++;
            charList.remove(0);
        }
    }

    //either 1 palindrome - 11
        // or two - 12
      else if (charList.size() == 2){
            if (charList[0] == charList[1]){
                numPalindromes++;
                charList.remove(0);
                charList.remove(0);
                break;
            }
            else {
            numPalindromes = numPalindromes + 2;
            charList.remove(0);
            charList.remove(0);
            break;
            }
        }

    //either 1 palindrome - 121
        //or three 123
       else  if (charList.size() == 3){
            if (charList[0] == charList[2])
            {
            numPalindromes++;
            charList.remove(0);
            charList.remove(0);
            charList.remove(0);
            break;
            }
            else{
            numPalindromes = numPalindromes + 3;
            charList.remove(0);
            charList.remove(0);
            charList.remove(0);
            break;
            }
        }

         //if only one char in the list it will always add
        else if (charList.size() == 1){
            numPalindromes++;
            charList.remove(0);
            break;
        }
    }

    return numPalindromes;
    }



    //string printer
    public static void printArrayString(List<String> stringList){
        string s = '';
        for (String currString : stringList){
            s += currString + '';
        }

        System.debug(s);
    }
}