using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Data.DTO
{
    public class SearchProductDTO
    {
		public int? Id { get; set; }
		public string Name { get; set; }
		public int? NameSearchMode { get; set; }
		public decimal? PriceFrom { get; set; }
		public decimal? PriceTo { get; set; }
		public string Brand { get; set; }
		public int? BrandSearchMode { get; set; }
		public string ManufactureCountry { get; set; }
		public int? ManufactureCountrySearchMode { get; set; }
		public DateTime? ManufactureDateFrom { get; set; }
		public DateTime? ManufactureDateTo { get; set; }
		public float? ScreenSizeFrom { get; set; }
		public float? ScreenSizeTo { get; set; }
		public string Resolution { get; set; }
		public int? ResolutionSearchMode { get; set; }
		public string DysplayType { get; set; }
		public int? DysplayTypeSearchMode { get; set; }
		public bool? ThreedimensionalTechnology { get; set; }
		public bool? WetCleaning { get; set; }
		public float? DustContainerVolumeFrom { get; set; }
		public float? DustContainerVolumeTo { get; set; }
		public int? AttachmentsCountFrom { get; set; }
		public int? AttachmentsCountTo { get; set; }
		public bool? RemoteLaunch { get; set; }
		public int? CleaningAreaFrom { get; set; }
		public int? CleaningAreaTo { get; set; }
		public float? TurnTableDiameterFrom { get; set; }
		public float? TurnTableDiameterTo { get; set; }
		public bool? Grill { get; set; }
		public int? MicrowavesPowerFrom { get; set; }
		public int? MicrowavesPowerTo { get; set; }
		public int? SimCardCountFrom { get; set; }
		public int? SimCardCountTo { get; set; }
		public bool? FrontCamera { get; set; }
		public bool? HeadphoneJack { get; set; }
		public int? BatteryCapacityFrom { get; set; }
		public int? BatteryCapacityTo { get; set; }
		public string ConnectionStandard { get; set; }
		public int? ConnectionStandardSearchMode { get; set; }
		public int? MinTemperatureFreezerFrom { get; set; }
		public int? MinTemperatureFreezerTo { get; set; }
		public int? ColdStorageTimeFrom { get; set; }
		public int? ColdStorageTimeTo { get; set; }
		public bool? Freezer { get; set; }
		public bool? Defrost { get; set; }
	}
}
