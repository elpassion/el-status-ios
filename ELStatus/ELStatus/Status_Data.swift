extension Status {
    static var mocks: [Status] {
        [Status(type: StatusType.off,
               comment: "test comment 1",
               dateModifiedString: "2020-04-14T10:44:00+0000",
               user: User(firstName: "Wojtek",
                          lastName: "Nowak")),
        Status(type: StatusType.remote,
               comment: "test comment 2",
               dateModifiedString: "2020-04-14T10:43:00+0000",
               user: User(firstName: "Kewin",
                          lastName: "Sam w domu")),
        Status(type: StatusType.sickLeave,
               comment: "test comment 3",
               dateModifiedString: "2020-04-14T10:47:00+0000",
               user: User(firstName: "Andrzej",
                          lastName: "Gołota")),
        Status(type: StatusType.sickLeave,
               comment: "test comment 4",
               dateModifiedString: "2020-04-14T10:42:00+0000",
               user: User(firstName: "Bartek",
                          lastName: "Wiśniewski")),
        Status(type: StatusType.sickLeave,
               comment: "test comment 5",
               dateModifiedString: "2020-04-11T10:41:00+0000",
               user: User(firstName: "Filip",
                          lastName: "Gryn"))]
    }
}
