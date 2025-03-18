using CommunityToolkit.Mvvm.Input;
using dotnet_new_maui_samplecontent.Models;

namespace dotnet_new_maui_samplecontent.PageModels;

public interface IProjectTaskPageModel
{
	IAsyncRelayCommand<ProjectTask> NavigateToTaskCommand { get; }
	bool IsBusy { get; }
}