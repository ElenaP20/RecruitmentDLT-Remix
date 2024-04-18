# Recruitment_Remix_IDE
This README.md file explains the Remix IDE setup for the following contracts:
1) Advert.sol
2) NFT.sol
3) Escrow.sol

1. Open Remix IDE - https://remix.ethereum.org/

![image](https://github.com/ElenaP20/Recruitment_Remix_IDE/assets/91874987/e35a4f2b-5123-4d49-891b-aece1e82b903)

2. Once opened, you will be located in a default workspace (Top Left corner, under "FILE EXPLORER")
3. By default, the "contracts" folder will be populated with sample files ("1_Storage.sol", "2_Owner.sol" and "3_Ballot.sol")
4. You can decide to keep or delete them, as they will not interfere with the process.
5. Download the three Solidity Files (Advert, NFT and Escrow) and place them in the "contracts" folder 
    1- Right click on the "contracts" file
    2- Last option should be "Upload files"
    3- Locate (where the files were downloaded) and upload them
    4- Make sure the names of the files are "Advert.sol", "NFT.sol" and "Escrow.sol"
6. Click on the files to open them
7. In the menu on the left-hand side, go to the third option, which should be the "Solidity compiler"

![image](https://github.com/ElenaP20/Recruitment_Remix_IDE/assets/91874987/ade26d6b-3262-4f7a-835e-e1bdbd1cd1f7)

You should be seeing the compiler version (in the picture: "0.8.25+commit.b61c2a91"). Make sure the first four digits are **above 0.8.17**!

8. Click on "Advanced Configurations" and you should be seeing the following:

![image](https://github.com/ElenaP20/Recruitment_Remix_IDE/assets/91874987/e32a9ded-0293-4699-8c95-ca39dce7529d)

    By default, the "Compiler configuration" should be selected. Under it there are two dropdown menus and one tickbox. 
    The first dropdown menu must be "LANGUAGE' and set to "Solidity". 
    The second menu should be "EVM VERSION" and it should be set to "london"

  Note:**It is very important that the evm version is london!**
  
9. Once the vesrion is set, compile the solidity files one by one. Successful compiling can be identified with the green tick on the "Solidity compiler" icon.

![image](https://github.com/ElenaP20/Recruitment_Remix_IDE/assets/91874987/44e040d2-b3ac-41e9-a4a0-66b81fd0b25d)

10. Next, locate the "Deploy & run transactions" on the left-handside menu. The icon is right under the "Solidity compiler" icon.
11. You should be seeing something similar to:

![image](https://github.com/ElenaP20/Recruitment_Remix_IDE/assets/91874987/9c979cb0-f8cf-40d9-8852-6e6b645ca8c2)

12. Before deploying:
  - From the "ENVIRONMENT" dropdown menu select "Remx VM (London)".

![image](https://github.com/ElenaP20/Recruitment_Remix_IDE/assets/91874987/b8bac43f-3ec2-4936-99f7-287695931d2e)

**Note: To make sure that the environment is set correctly, above the "Deploy" button, there should be an orange box with content "evm version:london". The version should match!**
  - The contracts can be deployed now, by selecting the Deploy button.
  - In the "CONTRACT" dropdown menu, for each contract you should choose the corresponding name (i.e for Advert.sol, navigate to the Advert.sol from the dropdown)
Note: If the "CONTRACT" box contains content different than "Advert.sol", "NFT.sol" and "Escrow.sol", an alert will appear, stating that abstract contracts cannot be implemented

![image](https://github.com/ElenaP20/Recruitment_Remix_IDE/assets/91874987/39789da7-9631-4549-a44c-e25537823234)

13. Upon successful deployment of the three contracts, they can be found under "Deployer/Unpinned Contracts" in the form of a drop down titled "Advert at 0X..." signaling the address, where the contract is deployed.
    
    **Note: The addresses are important to establish a connection between the contracts**
    
![image](https://github.com/ElenaP20/Recruitment_Remix_IDE/assets/91874987/106a2d6d-0dad-4bd4-bf95-4b0902d3a1a2)
    
  Before exploring the different functionalities of the contracts, they must be connected:
  - Review the functions from the drop down of the deployed Advert contract.
  - Navigate to the functions "setEscrow" and "setNFTContract". They expect the addresses, where the Escrow and NFT contracts were deployed as arguments respectively
   
![image](https://github.com/ElenaP20/Recruitment_Remix_IDE/assets/91874987/d7720a41-57b2-4dab-91b0-cc05445fdabf)

  - To get the addresses, next to the names of the contracts and their addresses, there are three options - "Copy", "Pin contract" and "Remove from list"

![image](https://github.com/ElenaP20/Recruitment_Remix_IDE/assets/91874987/39080c08-c342-49be-8b68-2605941250cf)

 - For the Escrow contract, click on "Copy" and paste the result in the "setEscrow" argument space. Call the function by clicking on its name, which should be now enabled.
   
![image](https://github.com/ElenaP20/Recruitment_Remix_IDE/assets/91874987/fabce24e-9d53-4203-b293-201a87ef6850)
   
 - For the NFT contract, click on "Copy" and paste the result in the "setNFTContract" as an argument. Call the function.
Note: Successful deployment is signalled in the terminal (positioned under the contract scripts)

![image](https://github.com/ElenaP20/Recruitment_Remix_IDE/assets/91874987/5279f3ee-03f2-4782-a70c-93f1f8ee8de0)

To view more about the transaction, click on the transaction in the terminal:

![image](https://github.com/ElenaP20/Recruitment_Remix_IDE/assets/91874987/ac4851e2-7046-47f1-a3d1-d94f6fe4b1de)

It should show the address that have called the function, the function name, address and more details like gas cost and transaction hash.

14. Upon successful deployment of the adresses, you can now experiment with the functions.

IMPORTANT:
This README.md is purely running the code in Solidity, it DOESN'T  show the full implementation version, which requires the following:
- the local oracle(_oracle.py_ and _contract_wrapper.py_) and processing python scripts (_ipfs_handler.py_, _file_processor.py, decryptor.py, key_value_extractor.py_ and _cv_parser.py_) all located in RecruitmentDLT repository in employer folder (https://github.com/ElenaP20/RecruitmentDLT).
- Ganache (https://archive.trufflesuite.com/ganache/) personal blockchain
- IPFS Desktop App (https://docs.ipfs.tech/install/ipfs-desktop/) or NFT.Storage(https://nft.storage/)
