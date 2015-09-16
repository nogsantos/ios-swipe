//
//  ViewController.m
//  GestoSwipe
//
//  Created by Fabricio Nogueira dos Santos on 9/16/15.
//  Copyright © 2015 Fabricio Nogueira. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self criaQuadrado];
    [self registraGesto];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 * Cria a view que será manipulada
 */
-(void) criaQuadrado{
    
    quadrado = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    quadrado.backgroundColor =  [UIColor yellowColor];
    [self.view addSubview:quadrado];
    
}
/**
 * Responsável por adicionar os swipes
 */
-(void) registraGesto{
    
    [self adicionaGesto:UISwipeGestureRecognizerDirectionRight];
    [self adicionaGesto:UISwipeGestureRecognizerDirectionLeft];
    
    [self adicionaGesto:UISwipeGestureRecognizerDirectionUp];
    [self adicionaGesto:UISwipeGestureRecognizerDirectionDown];
    
}
/**
 * Realiza o trabalho de adicionar os gestos
 */
-(void) adicionaGesto:(UISwipeGestureRecognizerDirection) direcao{
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]
                                        initWithTarget : self
                                        action         : @selector(jogaQuadrado:)
                                       ];
    swipe.direction                 = direcao;
    [self.view addGestureRecognizer:swipe];
}
/**
 *
 */
-(void) jogaQuadrado:(UIGestureRecognizer *) gesto{
    
    CGPoint location = [gesto locationInView:quadrado];
    /*
     * Verifica se o toque ocorreu na área do quadrado propriamente dito
     */
    if ([quadrado pointInside:location withEvent:nil]) {
        UISwipeGestureRecognizer *swipe = (UISwipeGestureRecognizer *)gesto;
        
        float novoX = swipe.direction == UISwipeGestureRecognizerDirectionLeft ? 0 : (self.view.frame.size.width - quadrado.frame.size.width);
        
        [UIView
            animateWithDuration : 0.3
            delay               : 0
            options             : UIViewAnimationOptionCurveEaseInOut
            animations:^{
                CGRect frame   = quadrado.frame;
                frame.origin.x = novoX;
                quadrado.frame = frame;
                
            } completion:nil
        ];
    }
}

@end

























