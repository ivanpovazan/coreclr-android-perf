using dotnet_new_maui_samplecontent.Models;
using dotnet_new_maui_samplecontent.PageModels;

namespace dotnet_new_maui_samplecontent.Pages;

public partial class MainPage : ContentPage
{
	public MainPage(MainPageModel model)
	{
		InitializeComponent();
		BindingContext = model;
	}
}