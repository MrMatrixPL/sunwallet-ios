import SwiftUI

struct HomeScreen: View {
    // MARK:- Environment
    @EnvironmentObject var blockchainStore: BlockchainStore
    @EnvironmentObject var dataSource: DataSource
    @EnvironmentObject var historyStore: HistoryStore
    
    // MARK:- Subviews
    private var title: Text {
        Text(blockchainStore.totalBalance.dollarString)
            .font(.largeTitle)
            .bold()
    }
    private var subtitle: Text {
        Text("Portfolio Balance")
    }
    private var scrollView: some View {
        SWScrollView(title: title, subtitle: subtitle) {
            VStack(alignment: .leading, spacing: 8) {
                WatchListSection(exchangeHistories: self.historyStore.favorites)
                TopMoversSection(assets: self.dataSource.topMovers)
                PromoteSection()
                NewsSection(articles: self.dataSource.articles)
            }
        }
    }
    
    var body: some View {
        NavigationView() {
            scrollView
        }
        .accentColor(.primary)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .environmentObject(DataSource())
    }
}