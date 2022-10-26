# kibble

## Architecture, packages, choices

Architecture
-------------
Clean code architecture was used in the development of this application,
where communication between layers move outwards. This means that the logic components
have no knowledge of underlying layers such as the UI. This decreased dependency between
layers subsequently has the effect that changes and fixes can be implemented without having
to tamper with various layers all at once.

Packages used
---------------
Equatable - used for state and event classes to eliminate boilerplate code

GetIt - used for dependency injection, mainly for BLoCs

Spinkit - my personal go-to for great loading animations

http - used for http requests

Transparent image - temporary workaround for FadingImage widget, as it needs a placeholder

Share Plus - used for sharing links natively on the device

Choices made
-------------
In conclusion I am quite happy with the end product. Modularity of the code was enforced
and everything gelled well. Widgets that are not constrained by once-off use cases were added
to the shared library, same goes for logic. Clean code projects can definitely spiral into a 
nested folder nightmare without proper planning. Comments are added to the code for more in-depth
explanations of indivual functions, etc.

![Alt Text](https://media.tenor.com/twIzlIPSrZcAAAAC/dog.gif)