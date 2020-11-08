using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business.Models.Input
{
    public class ProductInputModel
    {
        public int? Id { get; set; }
        public string Name { get; set; }
        public decimal? Price { get; set; }
        public string Brand { get; set; }
        public string Description { get; set; }
        public string ManufactureCountry { get; set; }
        public string ManufactureDate { get; set; }
        public float? Weight { get; set; }
        public int? Wattage { get; set; }
        public int? NoiseLevel { get; set; }
        public int? PresetPrograms { get; set; }
        public float? Width { get; set; }
        public float? Height { get; set; }
        public float? Depth { get; set; }
        public float? ScreenSize { get; set; }
        public string Resolution { get; set; }
        public string DysplayType { get; set; }
        public bool? ThreedimensionalTechnology { get; set; }
        public bool? WetCleaning { get; set; }
        public float? DustContainerVolume { get; set; }
        public int? AttachmentsCount { get; set; }
        public bool? RemoteLaunch { get; set; }
        public int? CleaningArea { get; set; }
        public float? TurnTableDiameter { get; set; }
        public int? NumberOfProwerLevel { get; set; }
        public bool? Grill { get; set; }
        public int? MicrowavesPower { get; set; }
        public int? SimCardCount { get; set; }
        public bool? FrontCamera { get; set; }
        public bool? HeadphoneJack { get; set; }
        public int? BatteryCapacity { get; set; }
        public string ConnectionStandard { get; set; }
        public int? MinTemperatureFreezer { get; set; }
        public int? ColdStorageTime { get; set; }
        public bool? Freezer { get; set; }
        public bool? Defrost { get; set; }
    }
}
