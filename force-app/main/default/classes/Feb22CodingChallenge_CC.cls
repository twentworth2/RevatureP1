public class Feb22CodingChallenge_CC {

    // Create a Visualforce page (named Feb22CodingChallenge_Page) that displays a table. 
    // This Visualforce page has a custom controller named Feb22CodingChallenge_CC, which itself uses a wrapper class named Feb22CodingChallenge_Wrapper.
    // The table in Feb22CodingChallenge_Page should have two columns: the first listing the name of an account and the second listing the sum of expected 
    // revenue from all of that account's related opportunities.
    public List<Feb22CodingChallenge_Wrapper> accountList{
        get{
            if (accountList == null)
            {
                accountList = new List<Feb22CodingChallenge_Wrapper>();
                for (Account a : [SELECT Id, Name FROM Account])
                {
                    accountList.add(new Feb22CodingChallenge_Wrapper(a));
                }
            }
            return accountList;
        }
        set;
    }
}