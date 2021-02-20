/////////////////////////////////////////////////////////////////
    //
    // Name: Project 0 Bravo
    // Author: Tristan Wentworth (tristan.wentworth@revature.net)
    // Date: 2/11/2021
    // Description: Series of apex methods to demonstrate
    // basic understanding of coding concepts.
    //
    /////////////////////////////////////////////////////////////////
    public class P0B {
    /*
     * 1. Return the nth Fibonacci number
     * Test Cases:
     * Input: 0     Output: 0
     * Input: 1    Output: 1
     * Input: 2     Output: 1
     * Input: 10    Output: 55
    */
    public static Integer nFibonacci( Integer n ){

        Integer firstNum = 0;
        Integer secondNum = 1;
        Integer finalVal = 0;

        //base case 1
        if (n == 0) {
            return firstNum;
        }

        //base case 2
        if (n == 1) {
            return secondNum;
        }

        //lil recurisive action because the current value is based on the 2 before it
        finalVal = nFibonacci(n-1) + nFibonacci(n-2);

        return finalVal;
        

    }

    /*
     * 2. Sort a list of integers.
     * Test Cases:
     * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
     * Input: [5,4,3,2,1]     Output: [1,2,3,4,5]
     *
     * Don't use the sort() method... that would be lame.
    */
    public static List<Integer> sortList( List<Integer> intList ) {

        //bubble sort - basically finds the largest number and keeps swapping it to the right
        for(Integer i = 0; i < intList.size() - 1; i++) {

            //i represents the number of vals in the sorted position on the right hence the -i added to the end value
            //don't need it but it is slightly more efficient
            for (Integer j = 0; j < intList.size() - 1 - i; j++){

                // if the number on the right of the current index is larger, then they swap
                if (intList[j] > intList [j + 1])
                    {
                        Integer temp = intList[j];
                        intList[j] = intList[j+1];
                        intList[j+1] = temp;
                    }
            }
         

        }
            return intList;
    }

    /*
     * 3. Return the factorial of n.
     * Test Cases:
     * Input: 0    Output: 1
     * Input: 1    Output: 1
     * Input: 3    Output: 6
    */
    public static Integer nFactorial( Integer n) {

        //our variable to keep track of the return value
        Integer finalVal = 0;

        //another recursive boi so we want a base case
        //factorials always multiply down to one and 1! = 1
        if (n == 1) {
            return 1;
        }

        //4! = 4*3*2*1 and 3*2*1 = 3!
        finalVal = n * nFactorial(n-1);

        return finalVal;

    }

    /*
     * 4. Rotate left
     * Given a list, list, and an integer, n, rotate the values in list left n times and return list
     * Test Cases:
     * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
    */
    public static List<Integer> rotateLeftNTimes( List<Integer> nList, Integer n) {

        for(Integer j = 0; j < n; j++){

            //makes a new rotlist each time to clear the values of the old one and get a new reference
            List<Integer> rotList = new List<Integer>();
            
            //this will shift it one time, i < the amount of numbers in the list -minus the first one
            for (Integer i = 0; i < nList.size() - 1; i++)
            {
                //add in values shifted by one
                rotList.add(nList[i + 1]);
            }
            //finish with the first value and put it at the end
            rotList.add(nList[0]);

            //switch our lists
            nList = rotList;
        }

        return nList;
    }

    /*
     * 5. Balanced Brackets
     * A bracket is any one of the following: (, ), {, }, [, or ]
     * 
     * The following are balanced brackets:
     *    ( )
     *    ( ) ( )
     *    ( ( ) )
     *    ( { [ ] } )
     *
     * The following are NOT balanced brackets:
     *   (
     *   )
     *   ( ( )
     *   ( [ ) ]
     *
     * Return true if balanced
     * Return false if not balanced
    */
    public static Boolean bracketsAreBalanced( String s ) {

        //this is used when checking to see if the chars are relfected
        Boolean rightChar = false;

        Integer numChars = s.length();

        //if an odd number of chars it will be false
        if (math.mod(numChars, 2) == 1)
        {
            return false;
        }

        //know the list is even in length so split down the middle
        //if 6 chars, middle index is 2 not 3
        Integer middleIndex = (numChars / 2) - 1;

        //now we check for reflections
         //checks the first and last then each goes one towards the middle
        for(Integer i = 0; i <= middleIndex; i++)
        {
            //40 = (
            //41 = )
           
            if (s.charAt(i) == 40)
            {
                if ((s.charAt(numChars - i - 1)) != 41){
                    return false;
                }  
                rightChar = true;
            }

            if (s.charAt(i) == 41)
            {
                if ((s.charAt(numChars - i - 1)) != 40){
                    return false;
                }  
                rightChar = true;
            }

            //91 = [
            //93 = ]

            if (s.charAt(i) == 91)
            {
                //should always mirror each other
                if ((s.charAt(numChars - i - 1)) != 93){
                    return false;
                }
                rightChar = true;
            }

            if (s.charAt(i) == 93)
            {
                //should always mirror each other
                if ((s.charAt(numChars - i - 1)) != 91){
                    return false;
                }
                rightChar = true;
            }

            //123 = {
            //125 = }

            if (s.charAt(i) == 123)
            {
                //should always mirror each other
                if ((s.charAt(numChars - i - 1)) != 125){
                    return false;
                }
                rightChar = true;
            }

            if (s.charAt(i) == 125)
            {
                //should always mirror each other
                if ((s.charAt(numChars - i - 1)) != 123){
                    return false;
                }
                rightChar = true;
            }

            if (!rightChar)
            {
                return false;
            }

            rightChar = false;
        }

        //if it passed those check then it is balanced
        return true;

    }

    /* You should NOT be submitting answers that you find online. You will be expected to be able to defend any of these solutions without notice. */

    /*
     * 6. Create a method that retrieves a list of all accounts and updates those accounts.
     *      Create a custom field on the Account standard object called Size__c that will be a 
     * picklist containing small/medium/large.
     *     Create a method that retrieves a list of all accounts. 
     *         - If an account has between 1-1000 employees then it is classified as small.
     *         - If an account has between 1001-10000 employees it is classified as medium.
    *         - If an account has more than 10000 employees it is classified as large.
     *     Update the Size__c field on each account to reflect the amount of employees in the Account.
    */
    // public static void updateAccountSize( ) {

    //     //get a list of all our accounts
    //     List<Account> accountList = [SELECT  NumberOfEmployees
    //                                  FROM Account];
        
    //     //for each account update its size based on the number of employees
    //     for (Account currentAccount : accountList){
            
    //         if(currentAccount.NumberOfEmployees <= 1000)
    //         {
    //             currentAccount.Size__c = 'Small';
    //         }

    //         else if((currentAccount.NumberOfEmployees <= 10000) && (currentAccount.NumberOfEmployees > 1000)){
    //             currentAccount.Size__c = 'Medium';
    //         }

    //         //can just have a default else here cause null would evaluate as that so any
    //         //company without number of employees would fall in
    //         else if (currentAccount.NumberOfEmployees > 10000){
    //             currentAccount.Size__c = 'Large';
    //         }

    //     }
    //     update accountList;
    // }

    /* 
     * 7. Create a method that will find all leads that contain 'ca' in their fields. 
     *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
     * Converted' and their description should display the message, "We are no longer doing 
     * business in California."
     */
    public static void updateCALeads( ) {
        //like is case sensitive only for case sensitve fields and state is not
        //California is the only state that starts with ca
        List<Lead> leadList = [SELECT  State
                                FROM Lead
                                WHERE State 
                                LIKE 'ca%'];

        //update all the california leads
        for(Lead currentLead : leadList)
        {
                currentLead.Status = 'Closed - Not Converted';
                currentLead.Description = 'We are no longer doing business in California.';
        }

        //send updates to database
        update leadList;
         
        
    }

    /*
     * 8. Create a method that will find all Opportunities which have already passed their Close Date 
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     */
    public static void closePastDueOpportunities( ) {

        List<Opportunity> oppList = [SELECT CloseDate, StageName
                                    FROM Opportunity
                                    WHERE StageName != 'Closed Won'];

        //for each opportunity that isnt closed won
        for (Opportunity currentOpp : oppList){
            
            //if past its closed date change the stage
            if(Date.today() > currentOpp.CloseDate){
                currentOpp.StageName = 'Closed Lost';
            }
        }
        update oppList;

    }

    //nice lil helper funtion to print lists
    public static void printArray(List<Integer> intList){
        string s = '';
        for (Integer currInt : intList){
            s += currInt + ' ';
        }

        System.debug(s);
    }

}