using dotnet_new_maui_samplecontent.Models;

namespace dotnet_new_maui_samplecontent.Pages.Controls;

public class ChipDataTemplateSelector : DataTemplateSelector
{
	public required DataTemplate SelectedTagTemplate { get; set; }
	public required DataTemplate NormalTagTemplate { get; set; }

	protected override DataTemplate OnSelectTemplate(object item, BindableObject container)
	{
		return (item as Tag)?.IsSelected ?? false ? SelectedTagTemplate : NormalTagTemplate;
	}
}