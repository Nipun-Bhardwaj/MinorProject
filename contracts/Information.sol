// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Information {
    struct Campaign {
        address owner;
        string name;
        string Address;
        string DOB;
        string Gender;
        string nationality;
        string image;
    }

    mapping(uint256 => Campaign) public campaigns;

    uint256 public numberOfCampaigns = 0;

    function createCampaign(
        address _owner,
        string memory _name,
        string memory _Address,
        string memory _DOB,
        string memory _Gender,
        string memory _nationality,
        string memory _image
    ) public returns (uint256) {
        Campaign storage campaign = campaigns[numberOfCampaigns];

        campaign.owner = _owner;
        campaign.name = _name;
        campaign.Address = _Address;
        campaign.DOB = _DOB;
        campaign.Gender = _Gender;
        campaign.nationality = _nationality;
        campaign.image = _image;

        numberOfCampaigns++;

        return numberOfCampaigns - 1;
    }

    function getCampaigns() public view returns (Campaign[] memory) {
        Campaign[] memory allCampaigns = new Campaign[](numberOfCampaigns);

        for (uint256 i = 0; i < numberOfCampaigns; i++) {
            Campaign storage item = campaigns[i];

            allCampaigns[i] = item;
        }

        return allCampaigns;
    }
}
