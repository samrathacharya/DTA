public class TestEmbedFlowController {
	public String apexVar {get; set;}

     public TestEmbedFlowController() {
         apexVar = apexpages.currentpage().getparameters().get('recId');
         system.debug('\n\n apexVar '+apexVar);
    }
}