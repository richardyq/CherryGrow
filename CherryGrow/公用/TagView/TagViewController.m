//
//  TagViewController.m
//  YYCommon
//
//  Created by YinQ on 2018/8/8.
//

#import "TagViewController.h"

@interface TagViewController ()
<UIPageViewControllerDelegate,
UIPageViewControllerDataSource>

@property (nonatomic, strong) TagView* tagView;
@property (nonatomic, strong) UIPageViewController* pageViewController;

@end

@implementation TagViewController

- (void) dealloc{
    [self.tagView removeObserver:self forKeyPath:@"selectIndex"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self layoutElements];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) layoutElements{
    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(@45);
    }];
    
    [self.pageViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.tagView.mas_bottom);
    }];
}

#pragma mark - settingAndGetting
- (TagView*) tagView{
    if (!_tagView ) {
        _tagView = [TagView new];
        [self.view addSubview:_tagView];
        [_tagView addObserver:self forKeyPath:@"selectIndex" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    }
    return _tagView;
}

- (UIPageViewController*) pageViewController{
    if (!_pageViewController) {
        _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageViewController.delegate = self;
        _pageViewController.dataSource = self;
        [self addChildViewController:_pageViewController];
        [self.view addSubview:_pageViewController.view];
    }
    return _pageViewController;
}

- (void) setControllers:(NSArray<UIViewController *> *)controllers{
    _controllers = controllers;
    NSArray<NSString*>* titles = [controllers valueForKey:@"title"];
    [self.tagView createTagCells:titles];
    [self.pageViewController setViewControllers:@[controllers.firstObject] direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

- (void) setSelectTagColor:(UIColor *)selectTagColor{
    [self.tagView setSelectTagColor:selectTagColor];
}

#pragma mark - UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSInteger controlIndex = [self.controllers indexOfObject:viewController];
    if (controlIndex == 0 || controlIndex == NSNotFound) {
        return nil;
    }

    return self.controllers[--controlIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSInteger controlIndex = [self.controllers indexOfObject:viewController];
    if (controlIndex == NSNotFound || controlIndex == (self.controllers.count - 1)) {
        return nil;
    }
    
    return self.controllers[++controlIndex];
}

#pragma mark - UIPageViewControllerDataSource
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers
{
    NSInteger index = [self.controllers indexOfObject:pendingViewControllers.firstObject];
    [self.tagView setSelectIndex:index];
}



#pragma mark - observice
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (object == self.tagView) {
        if ([keyPath isEqualToString:@"selectIndex"]) {
            UIPageViewControllerNavigationDirection direction = UIPageViewControllerNavigationDirectionReverse;
            NSInteger index = [self.controllers indexOfObject: [self.pageViewController.viewControllers firstObject] ];
            if (index == self.tagView.selectIndex) {
                return;
            }
            if (index < self.tagView.selectIndex) {
                direction = UIPageViewControllerNavigationDirectionForward;
            }
            [self.pageViewController setViewControllers:@[self.controllers[self.tagView.selectIndex]] direction:direction animated:YES completion:nil];
        }
    }
    
}
@end
