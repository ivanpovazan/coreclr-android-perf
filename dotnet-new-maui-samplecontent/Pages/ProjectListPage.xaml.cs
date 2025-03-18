namespace dotnet_new_maui_samplecontent.Pages;

public partial class ProjectListPage : ContentPage
{
	public ProjectListPage(ProjectListPageModel model)
	{
		BindingContext = model;
		InitializeComponent();
	}
}