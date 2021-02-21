#  idealista iOS Challenge

This project is using VIP (Clean Swift) design pattern. 

https://clean-swift.com/

VIP is an evolution of VIPER design pattern in which the information flow is unidirectional.
The communication between the components of a scene are made through protocols. This makes each component of a scene less tightly tied to the others. Altough the components are similar to the ones used in VIPER, in VIP, the viewcontroller is the center of the scene, accesing interactor and router directly. Presenter is only used to transform the business logic or data passed from the interactor into a displayable content (viewmodel, cellModels...) and send it to the view. This solves one of the main issues with VIPER, being that the presenter is no longer bidirectional and has to deal with navigation and all the viewcontroller inputs. 

![VIP flow](https://miro.medium.com/max/700/0*Q2qPUtCiefnnjdVI)

## Pods

The following pods were added to the project:

- Snapkit  (setup views constraints programatically)
- SnapshotTesting (test UI using snapshots)

## UI 

I decided to use SnapKit on this project to practice creating and setup views programatically (because it is the way to go for apple in the following years using SwiftUI and i wanted to learn to do it un UIKit). Although all the views in this project are made using SnapKit, i always use .xibs for each view and i even have templates to create cells using the pattern used here: 

## Cell implementation example

This implementation make the cell management easier using protocols. The tableviewcontroller doesnt have to know the specific type of cell used and you can even mix different cells in the same array as long as they conform to the same DrawerItemProtocol.

- CellModel: class containing all the info that the cell are gonna need to show.
- Drawer: class that dequeue and draw the cell using the model info.
- Cell: The actual cell that only serves as a container for views and shouldnt have any logic.

# Scenes

## AD LIST 
In this scene, the list of ads retrieved by the API are shown using cells containing a carousel to view all the pictures of each ad scrolling between them.

![alt text](https://i.imgur.com/YNbIf5u.png)

Also, if an error is returned by the API, an empty state will be shown:

![alt text](https://i.imgur.com/YIRX8HA.png)

The screen can be reloaded pulling down so if an error is shown, the user can reload the screen easily.

## AD DETAIL
when the user clicks on any ad, a new screen with the ad details will be shown. This screen contains the current favorite status of the add. Another carousel showing off all the images available of the ad. A description of the house and the price tag.

![alt text](https://i.imgur.com/Gju3J7p.png)

If the movie detail call results in error, an alert will be shown so the user can acept it and exit the failing ad

## FAVORITE ADS 

## Unit Testing & Snapshot Testing

Unit testing and snapshot testing were implemented to test the three main scenes on the app (adList, adDetail, favoriteAds).

