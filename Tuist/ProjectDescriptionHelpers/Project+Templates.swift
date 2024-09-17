import ProjectDescription


public extension Project {
    static func makeModule(
        name: String,
        platform: Platform = .iOS,
        product: Product,
        organizationName: String = "b1nd",
        packages: [Package] = [],
        deploymentTarget: DeploymentTargets? = .iOS("16.4"),
        infoPlist: InfoPlist = .default,
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        entitlements: Entitlements? = nil,
        dependencies: [TargetDependency] = []
    ) -> Project {
        var baseSettings = SettingsDictionary()
            .debugInformationFormat(.dwarfWithDsym)
        let settings: Settings = .settings(
            configurations: [
                .debug(name: .debug, settings: baseSettings),
                .release(name: .release, settings: baseSettings)
            ], defaultSettings: .recommended)
        
        let schemes: [Scheme] = [.makeScheme(target: .debug, name: name)]

        return Project(
            name: name,
            organizationName: organizationName,
            packages: packages,
            settings: settings,
            targets: [
                .target(
                    name: name,
                    destinations: [.iPhone],
                    product: .app,
                    bundleId: "com.\(organizationName).alimo",
                    deploymentTargets: .iOS("16.4"),
                    infoPlist: infoPlist,
                    sources: sources,
                    resources: resources,
                    entitlements: entitlements,
                    dependencies: dependencies,
                    settings: .settings(base: ["OTHER_LDFLAGS": .string("-ObjC")])
                )
            ],
            schemes: schemes
        )
    }
}

extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme.scheme(
            name: name,
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
}
