using Syncfusion.Maui.Toolkit.Charts;

namespace dotnet_new_maui_samplecontent.Pages.Controls;

public class LegendExt : ChartLegend
{
	protected override double GetMaximumSizeCoefficient()
	{
		return 0.5;
	}
}
