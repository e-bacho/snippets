public class MyClass
{
	public Integer LISTCURRENTPAGE {get; set;}
	public Integer LISTTOTALPAGES {get; set;}
	public Integer ROWSPERPAGE {get {return 10;} set;}

	public void init()
	{
		LISTCURRENTPAGE = 1;
		LISTTOTALPAGES = (Integer)((LIST.size() / ((Decimal)ROWSPERPAGE)).round(RoundingMode.UP));
	}

	public void swapPage()
	{
		String action = Apexpages.currentPage().getParameters().get('action');

		if (action == 'first') { LISTCURRENTPAGE = 1; }
		else if (action == 'prev' && LISTCURRENTPAGE > 1) { LISTCURRENTPAGE--; }
		else if (action == 'next' && LISTCURRENTPAGE < LISTTOTALPAGES) { LISTCURRENTPAGE++; }
		else if (action == 'last') { LISTCURRENTPAGE = LISTTOTALPAGES; }
	}
}