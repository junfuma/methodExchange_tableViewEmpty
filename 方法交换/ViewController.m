/**
 方法交换
 
 dang dataList 为空的时候  添加空白提示
 
 https://github.com/dzenbot/DZNEmptyDataSet
 
 
 */
#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic , strong)UITableView *tableView ;
@property (nonatomic , strong)NSMutableArray *dataList ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.dataList = @[];
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 ;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataList.count ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * showUserInfoCellIdentifier = @"ShowUserInfoCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil){
        // Create a cell to display an ingredient.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:showUserInfoCellIdentifier] ;
        
    }
    // Configure the cell.
    cell.textLabel.text=@"签名";
    cell.detailTextLabel.text =@"ooo";
    
    return cell;
        
}
- (NSMutableArray *)dataList
{
    if (_dataList) {
        _dataList = [NSMutableArray array];
    }
    return  _dataList ;
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView= [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self ;
        _tableView.dataSource =self;
    }
    return _tableView;
}
@end
