using E_Shop.Core;
using E_Shop.Data.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace E_Shop.Business
{
    public class Category: ICategory
    {
        private List<ProductDTO> tmp = new List<ProductDTO>();
        public List<ProductDTO> GetAllProductsByCategory(List<ProductDTO> allProducts, int type)
        {
            switch (type)
            {
                case (int)ProductCategory.Television:
                    {
                        foreach (var i in allProducts)
                        {
                            if (i.ScreenSize != null &&
                                i.Resolution != null &&
                                i.DysplayType != null &&
                                i.ThreedimensionalTechnology != null)
                            {
                                tmp.Add(i);
                            }
                        }
                        break;
                    }
                case (int)ProductCategory.Hoover:
                    {
                        foreach (var i in allProducts)
                        {
                            if (i.WetCleaning != null &&
                                i.DustContainerVolume != null &&
                                i.AttachmentsCount != null &&
                                i.RemoteLaunch == false)
                            {
                                tmp.Add(i);
                            }
                        }
                        break;
                    }
                case (int)ProductCategory.RoboHoover:
                    {
                        foreach (var i in allProducts)
                        {
                            if (i.WetCleaning != null &&
                                i.DustContainerVolume != null &&
                                i.AttachmentsCount != null &&
                                i.RemoteLaunch == true)
                            {
                                tmp.Add(i);
                            }
                        }
                        break;
                    }
                case (int)ProductCategory.Microwave:
                    {
                        foreach (var i in allProducts)
                        {
                            if (i.TurnTableDiameter != null &&
                                i.NumberOfProwerLevel != null &&
                                i.Grill != null &&
                                i.MicrowavesPower != null)
                            {
                                tmp.Add(i);
                            }
                        }
                        break;
                    }
                case (int)ProductCategory.Telephone:
                    {
                        foreach (var i in allProducts)
                        {
                            if (i.SimCardCount != null &&
                                i.FrontCamera != null &&
                                i.HeadphoneJack != null &&
                                i.BatteryCapacity != null)
                            {
                                tmp.Add(i);
                            }
                        }
                        break;
                    }
                case (int)ProductCategory.Fridge:
                    {
                        foreach (var i in allProducts)
                        {
                            if (i.MinTemperatureFreezer != null &&
                                i.ColdStorageTime != null &&
                                i.Freezer != null &&
                                i.Defrost != null)
                            {
                                tmp.Add(i);
                            }
                        }
                        break;
                    }
            }
            return tmp;
        }
    }
}
