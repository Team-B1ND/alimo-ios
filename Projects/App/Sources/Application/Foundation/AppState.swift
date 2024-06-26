import Foundation
fileprivate let memberCache = MemberCache.live
fileprivate let memberService = MemberService.live

final class AppState: ObservableObject {
    @Published var member: Member?
    @Published var isAlarmOn: Bool = memberCache.getIsAlarmOn() {
        didSet {
            memberCache.saveIsAlarmOn(isAlarmOn)
            Task {
                await setAlarm(isAlarmOff: !isAlarmOn)
            }
        }
    }
    
    @MainActor
    func fetchMember() {
        Task {
            member = try await MemberService.live.getMemberInfo()
            guard let member else { return }
            isAlarmOn = !member.isOffAlarm
        }
    }
    
    @MainActor
    private func setAlarm(isAlarmOff: Bool) async {
        do {
            _ = try await memberService.alarmOnOff(isOffAlarm: isAlarmOff)
            print("ProfileVM - isAlarmOff - \(isAlarmOff)")
        } catch {
            debugPrint(error)
        }
    }
    
}
