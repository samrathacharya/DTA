public class StripHTMLTags {
	@InvocableMethod(label='Remove HTML Tags')
    public static List<String> removeHtmlTags(List<String> richTextList){
        String richText = richTextList[0];
        List<String> plainTextList = new List<String>();
        richText = richText.stripHtmlTags();
        plainTextList.add(richText);
        return plainTextList;
    }
}