#show works/2.
#show -works/2.
works(Person,Sp) :-
    saxophone(Sp), has(Person,Sp),ispart(spring,Sp),-broken(Person,spring).
-works(Person,Sp) :-saxophone(Sp), has(Person,Sp),not works(Person,Sp).
-ispart(Subpart,Super) :- part(Subpart),part(Super);saxophone(Super),not ispart(Subpart,Super).
ispart(dkey,selmermark).
ispart(spring,dkey).
ispart(Subpart,Super) :- Subpart != Super,ispart(Sub2,Super),ispart(Subpart,Sub2).
-broken(Person,spring) :- has(Person,Sp), saxophone(Sp),owned(Person,spring),not broken(Person,spring).
owned(Person,Part) :- has(Person,Sp), saxophone(Sp),ispart(Part,Sp),not -ispart(Part,Sp).
broken(mo,spring).
saxophone(selmermark). 
part(spring).
part(dkey).
has(jake,selmermark). 
has(mo,selmermark).




