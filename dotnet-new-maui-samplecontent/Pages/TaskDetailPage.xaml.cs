namespace dotnet_new_maui_samplecontent.Pages;

public partial class TaskDetailPage : ContentPage
{
	public TaskDetailPage(TaskDetailPageModel model)
	{
		InitializeComponent();
		BindingContext = model;
	}
}