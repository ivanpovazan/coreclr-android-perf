#nullable disable
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using dotnet_new_maui_samplecontent.Data;
using dotnet_new_maui_samplecontent.Models;
using dotnet_new_maui_samplecontent.Services;

namespace dotnet_new_maui_samplecontent.PageModels;

public partial class ProjectListPageModel : ObservableObject
{
	private readonly ProjectRepository _projectRepository;

	[ObservableProperty]
	private List<Project> _projects = [];

	public ProjectListPageModel(ProjectRepository projectRepository)
	{
		_projectRepository = projectRepository;
	}

	[RelayCommand]
	private async Task Appearing()
	{
		Projects = await _projectRepository.ListAsync();
	}

	[RelayCommand]
	Task NavigateToProject(Project project)
		=> Shell.Current.GoToAsync($"project?id={project.ID}");

	[RelayCommand]
	async Task AddProject()
	{
		await Shell.Current.GoToAsync($"project");
	}
}