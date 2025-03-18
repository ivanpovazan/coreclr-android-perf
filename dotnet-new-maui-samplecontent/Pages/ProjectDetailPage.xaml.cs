using dotnet_new_maui_samplecontent.Models;

namespace dotnet_new_maui_samplecontent.Pages;

public partial class ProjectDetailPage : ContentPage
{
	public ProjectDetailPage(ProjectDetailPageModel model)
	{
		InitializeComponent();

		BindingContext = model;
	}
}
