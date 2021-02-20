public class Feb15CodingChallenge {
    public static Map<String, Double> getOppRevByAccount() {
         Map <String, Double> revByAccountList = new Map <String, Double>();
        List<AggregateResult> sumRevList = [SELECT SUM(ExpectedRevenue) sumExpected, AccountId FROM Opportunity GROUP BY AccountId];

        for(AggregateResult sumRev : sumRevList){
            if((Double) sumRev.get('sumExpected') > 0){
                revByAccountList.put((String) sumRev.get('AccountId'), (Double) sumRev.get('sumExpected'));
            }
        }
        // for(Id key: revByAccountList.keySet())
        // {
        //     System.debug(key + ' ' + revByAccountList.get(key));
        // }
        return revByAccountList;
    }
}