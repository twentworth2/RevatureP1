public inherited sharing class Feb22CodingChallenge_Wrapper {

    public Account acct {get; set;}
    public Double sumRev {get; set;}
    Map<String, Double> oppRevMap = new  Map<String, Double> ();

    public Feb22CodingChallenge_Wrapper(Account a) {
        acct = a;
        oppRevMap = Feb15CodingChallenge.getOppRevByAccount();
        sumRev = oppRevMap.get('' + a.Id);

    }
}