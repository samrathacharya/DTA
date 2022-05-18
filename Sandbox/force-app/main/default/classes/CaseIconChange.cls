public class CaseIconChange {
    @AuraEnabled
    public  static string getIcon(Id caseId)
    {
        string source =caseId;    
        Case caseRec = [select Id, CaseNumber, Origin from Case where Id =: caseId];
        if(caseRec.Origin!=null && caseRec.Origin!='')
        {
            if(caseRec.Origin=='Phone'){
                source='call-'+caseRec.Origin;
            }
            if(caseRec.Origin=='Email'){
                source='email-'+caseRec.Origin;
            }
            if(caseRec.Origin=='Field'){
                source='tablet_landscape-'+caseRec.Origin;
            }
            if(caseRec.Origin=='Internal'){
                source='case-'+caseRec.Origin;
            }
        }   
        return source;
    }
}