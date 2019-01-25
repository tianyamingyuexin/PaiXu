//
//  ViewController.m
//  PaiXu
//
//  Created by guangshu01 on 2018/3/9.
//  Copyright © 2018年 guangshu01. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
  NSMutableArray *array = [NSMutableArray arrayWithObjects:@"8",@"78",@"48",@"15",@"1",@"9",@"5",@"4",@"8", nil];
   

  NSArray *sortArray = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
      
      NSNumber *num1 = [NSNumber numberWithInteger:[obj1 integerValue]];
      NSNumber *num2 = [NSNumber numberWithInteger:[obj2 integerValue]];
      //升序
      return [num1 compare:num2];
      //降序
//      return [num2 compare:num1] ;
  }];


    NSLog(@"--%@",sortArray);
}


#pragma mark - 冒泡升序排序
- (void)bubbleAscendingOrderSortWithArray:(NSMutableArray *)array
{
    for (int i = 0; i < array.count; i++)
    {
        for (int j = 0; j < array.count - 1 - i;j++)
        {
            if ([array[j+1]intValue] < [array[j] intValue])
            {
                NSString *temp = array[j];
                array[j] = array[j+1];
                array[j+1] = temp;
            }
        }
    }
}

#pragma mark - 冒泡降序排序
- (void)bubbleDescendingSortWithArray:(NSMutableArray *)array
{
    for (int i = 0; i<array.count; i++)
    {
        for (int j = 0; j<array.count-1-i; j++)
        {
            if ([array[j] integerValue]<[array[j+1] integerValue])
            {
                NSString *temp = array[j];
                array[j] = array[j+1];
                array[j+1] = temp;
            }
        }
    }
}

#pragma mark - 选择升序排序
- (NSMutableArray *)selectionAscendingOrderSortWithArray:(NSMutableArray *)array
{
    for (int i = 0; i<array.count; i++)
    {
        for (int j = i+1; j<array.count; j++)
        {
            if ([array[i] integerValue]<[array[j] integerValue])
            {
                NSString *temp = array[j];
                array[j] = array[i];
                array[i] = temp;
            }
        }
    }
    return array;
}

#pragma mark - 选择降序排序
- (NSMutableArray *)selectionDescendingOrderSortWithArray:(NSMutableArray *)array
{
    for (int i = 0; i<array.count; i++)
    {
        for (int j = i+1; j<array.count; j++)
        {
            if ([array[i] integerValue]>[array[j] integerValue])
            {
                NSString *temp = array[j];
                array[j] = array[i];
                array[i] = temp;
            }
        }
    }
    return array;
}

#pragma mark - 快速升序排序
-(void)quickAscendingOrderSort:(NSMutableArray *)arr leftIndex:(NSInteger)left rightIndex:(NSInteger)right
{
    if (left < right)
    {
        NSInteger temp = [self getMiddleIndex:arr leftIndex:left rightIndex:right];
        [self quickAscendingOrderSort:arr leftIndex:left rightIndex:temp-1];
        [self quickAscendingOrderSort:arr leftIndex:temp + 1 rightIndex:right];
    }
    NSLog(@"快速升序排序结果：%@", arr);
}
- (NSInteger)getMiddleIndex:(NSMutableArray *)arr leftIndex:(NSInteger)left rightIndex:(NSInteger)right
{
    NSInteger tempValue = [arr[left] integerValue];
    while (left<right)
    {
        while (left<right&&[arr[right] integerValue]>=tempValue)
        {
            right --;
        }
        if(left<right)
        {
            arr[left] = arr[right];
        }
        while (left<right&&[arr[left] integerValue]<=tempValue)
        {
            left ++;
        }
        if (left<right)
        {
            arr[right] = arr[left];
        }
    }
    arr[left] = [NSString stringWithFormat:@"%ld",tempValue];
    return left;
}

#pragma mark - 插入排序   升序


- (void)insertionAscendingOrderSort:(NSMutableArray *)ascendingArr
{
    for (NSInteger i = 1; i < ascendingArr.count; i ++) {
        NSInteger temp = [ascendingArr[i] integerValue];
        for (NSInteger j = i - 1; j >= 0 && temp < [ascendingArr[j] integerValue]; j --) {
            ascendingArr[j + 1] = ascendingArr[j];
            ascendingArr[j] = [NSNumber numberWithInteger:temp];
        }
    }
    NSLog(@"插入升序排序结果：%@",ascendingArr);
}



#pragma mark - 归并升序排序
- (void)megerSortAscendingOrderSort:(NSMutableArray *)ascendingArr
{
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:1];
    for (NSNumber *num in ascendingArr) {
        NSMutableArray *subArray = [NSMutableArray array];
        [subArray addObject:num];
        [tempArray addObject:subArray];
    }
    while (tempArray.count != 1) {
        NSInteger i = 0;
        while (i < tempArray.count - 1)
        {
            tempArray[i] = [self mergeArrayFirstList:tempArray[i] secondList:tempArray[i + 1]];
            [tempArray removeObjectAtIndex:i + 1];
            
            i++;
        }
    }
    NSLog(@"归并升序排序结果：%@", ascendingArr);
}

- (NSArray *)mergeArrayFirstList:(NSArray *)array1 secondList:(NSArray *)array2 {
    NSMutableArray *resultArray = [NSMutableArray array];
    NSInteger firstIndex = 0, secondIndex = 0;
    while (firstIndex < array1.count && secondIndex < array2.count) {
        if ([array1[firstIndex] floatValue] < [array2[secondIndex] floatValue]) {
            [resultArray addObject:array1[firstIndex]];
            firstIndex++;
        } else {
            [resultArray addObject:array2[secondIndex]];
            secondIndex++;
        }
    }
    while (firstIndex < array1.count) {
        [resultArray addObject:array1[firstIndex]];
        firstIndex++;
    }
    while (secondIndex < array2.count) {
        [resultArray addObject:array2[secondIndex]];
        secondIndex++;
    }
    return resultArray.copy;
}

- (void)testNolsg
{
    NSLog(@"pringsss hhg  hshgg h  g文耳语iojhg");
}
@end
