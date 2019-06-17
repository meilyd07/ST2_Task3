//
//  MainViewModel.m
//  ImageLoadApp
//
//  Created by Hanna Rybakova on 6/15/19.
//  Copyright © 2019 None. All rights reserved.
//

#import "MainViewModel.h"

@interface MainViewModel()
@property (strong, nonatomic) NSArray *data;
@property (nonatomic, strong) NSCache *imageCache;
@end

@implementation MainViewModel

-(void)loadData {
    self.imageCache = [[NSCache alloc] init];
    self.data = @[@"https://img2.akspic.com/image/32372-privlekatelnost-meh-morda-usy-kotenok-2048x1536.jpg",
                  @"https://apod.nasa.gov/apod/image/1906/N00172886_92_beltramini.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/c/c4/Ferrofluid_large_spikes.jpg",
                  @"https://www.jpl.nasa.gov/spaceimages/images/largesize/PIA23268_hires.jpg",
                  @"https://www.jpl.nasa.gov/spaceimages/images/largesize/PIA23273_hires.jpg",
                  @"https://img2.akspic.com/fit/131792-heat-fire-lighting-interior_design-tealight-x750.jpg",
                  @"https://www.jpl.nasa.gov/spaceimages/images/largesize/PIA22948_hires.jpg",
                  @"https://www.rautomead.com/uploads/images/gallery/1522251890RT650bronzeholows.jpg",
                  @"https://img2.akspic.com/fit/19487-high_tech-font-keyboard-technology-tech-x750.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/1/13/Large_clematis_%28red%29.JPG",
                  @"https://upload.wikimedia.org/wikipedia/commons/7/7f/Archaefructus_liaoningensis.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/9/96/Ambrosius_Bosschaert_the_Elder_%28Dutch_-_Flower_Still_Life_-_Google_Art_Project.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/4/4e/Mammillaria_prolifera20100407_076.jpg",
                  @"https://img1.akspic.com/fit/127194-gorodskoj_rajon-chikago-manhetten-metropoliya-zdanie-x750.jpg",
                  @"https://img2.akspic.com/fit/18390-zdanie-metropoliya-dnevnoe_vremya-gorodskoj_pejzazh-chikago-x750.jpg",
                  @"https://img1.akspic.com/fit/18558-orientir-gorodskoj_rajon-neboskreb-empajr_stejt_bilding-gorodskoj_pejzazh-x750.jpg",
                  @"https://img2.akspic.com/fit/131685-wedding_invitation-helmet-pearl-lace-earring-x750.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/7/72/Spilanthes-closeup-large.jpg",
                  @"https://www.rautomead.com/uploads/images/gallery/1522161415CuMgcoredwire.jpg",
                  @"https://img3.akspic.com/fit/124066-drop-handheld_devices-water-apple-apples-x750.jpg",
                  @"https://www.rautomead.com/uploads/images/gallery/1512388027rautomeadcathodemelting.jpg",
                  @"https://www.rautomead.com/uploads/images/gallery/1512123485rautomeadRMTbilletcastingsilverbandsaw.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/5/5d/Crateva_religiosa.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/4/4d/Bees_Collecting_Pollen_cropped.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/f/f5/Ophrys_apifera_flower1.jpg",
                  @"https://www.rautomead.com/uploads/images/gallery/1512122971rautomeadRS25008mmbrasswire.jpg",
                  @"https://img3.akspic.com/fit/15019-superfood-vegetarianism-diet-natural_foods-tomato-x750.jpg",
                  @"https://www.rautomead.com/uploads/images/gallery/1512122354rautomeadgoldbondingwirerod99.999.jpg",
                  @"https://img3.akspic.com/image/131767-present-tree-holiday-christmas-red-540x960.jpg",
                  @"https://img2.akspic.com/fit/63075-technology-the_avengers-creative_arts-tech-purple-x750.jpg",
                  @"https://img1.akspic.com/image/131987-full_rigged_ship-yacht-hotel-yacht_charter-travel-1920x1200.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/5/5f/Adenium_obesum_%28Kyoto_Botanical_Garden%29.JPG",
                  @"https://upload.wikimedia.org/wikipedia/commons/1/1f/Bush2.jpg",
                  @"https://img3.akspic.com/fit/134495-tekken_7-fortnite-audio_equipment-ear-counter_strike_global_offensive-x750.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/c/c0/Alyxia.oliviformis1web.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/8/81/Vincetoxicum_nigrum_03_ies.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/d/dc/Cerbera_odollam.jpg",
                  @"https://img2.akspic.com/image/100819-vacation-volcano-ecosystem-hill-mount_scenery-1920x1200.jpg", @"https://upload.wikimedia.org/wikipedia/commons/4/42/Mimulopsis_violacea%2C_a_characteristic_plant_of_the_upper_forest_in_Equatorial_Africa.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/a/ac/Systema_Naturae_cover.jpg",
                  @"https://upload.wikimedia.org/wikipedia/commons/f/fd/Beli-hibiskus.jpg",
                  @"https://img1.akspic.com/fit/48325-sneg-alpy-oblako-zamorazhivanie-gornyj_relef-x750.jpg",
                  @"https://img2.akspic.com/fit/129818-vegetable-whole_food-fruit-food-tomato_juice-x750.jpg",
                  @"https://img1.akspic.com/fit/127583-vysokij_korabl-korablekrushenie-more-galeon-parusnik-x750.jpg",
                  @"https://img1.akspic.com/fit/127533-pervyj_kurs-burya-manilskij_galeon-tryum_polnyj-parusnaya_shlyupka-x750.jpg",
                  @"https://img3.akspic.com/fit/93920-brig-brigantina-barka-parusnik-yahta-x750.jpg",
                  @"https://img2.akspic.com/fit/125576-elektronnoe_ustrojstvo-tehnologia-microsoft_poverhnost-svet-kabel-x750.jpg",
                  @"https://img2.akspic.com/fit/125379-iskusstvo-krug-art-dizajn-vizualnoe_iskusstvo-x750.jpg",
                  @"https://img1.akspic.com/fit/125448-macbook-apple_masvook_pro-krasnyj_cvet-tekstura-plamya-x750.jpg",
                  @"https://img3.akspic.com/image/3373-koshki-kotenok-porody_sobak-koshki_sfinksy-koshki_i_sobaki-2048x1536.jpg",
                  @"https://cdn.eso.org/images/screen/eso1907b.jpg",
                  @"https://img3.akspic.com/fit/124206-internet-search_engine_optimization-world_wide_web-google-brand-x750.jpg",
                  @"https://v-kosmose.com/wp-content/uploads/2015/01/M104_ngc4594_sombrero_galaxy_hi-res.jpg",
                  @"https://img2.akspic.com/fit/32832-composer-nature-art-creative_arts-album-x750.jpg", @"https://img2.akspic.com/image/9929-velsh_springer_spaniel-spaniel_klamber-anglijskij_koker_spaniel-anglijskij_springer_spaniel-novoshotlandskij_retriver-2048x1536.jpg",
                  @"https://img1.akspic.com/fit/133241-texture-nature-daytime-painting-day-x750.jpg", @"https://img1.akspic.com/image/78600-amerikanskij_koker_spaniel-pes-porody_gruppy_sobak-zivotnoe-rozhdestvenskij_den-2048x1536.jpg",
                  @"https://img2.akspic.com/image/95406-alyaskinskij_malamut-husky-alyaskinskij_haski-labrador-ezdovaya_sobaka-2048x1536.jpg",
                  @"https://img3.akspic.com/image/32308-usy-morda-sobaka-pes-shhenok-2048x1536.jpg"
                  ];
}

- (void)loadImages {
    NSOperationQueue *imageOperationQueue = [[NSOperationQueue alloc]init];
    for (int i = 0; i< self.data.count; i++) {
        [imageOperationQueue addOperationWithBlock:^{
            NSString *imageUrlString = self.data[i];
            NSURL *imageurl = [NSURL URLWithString:imageUrlString];
            UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageurl]];
            
            if (img != nil) {
                [self.imageCache setObject:img forKey:imageUrlString];
                NSString *sValue = [@(i) stringValue];
                NSDictionary *dictionary = @{@"cellIndex": sValue};
                [[NSNotificationCenter defaultCenter]
                 postNotificationName:@"ImageLoaded"
                 object:imageUrlString
                 userInfo:dictionary];
            }
        }];
    }
}

- (NSInteger)getDataCount {
    return self.data.count;
}

- (NSString *)getDescription:(NSInteger)index {
    return self.data[index];
}

- (UIImage *)getImage:(NSInteger)index {
    UIImage *imageFromCache = [self.imageCache objectForKey:self.data[index]];
    if (imageFromCache) {
        return imageFromCache;
    } else {
        return [UIImage imageNamed:@"noImage"];
    }
}

- (DetailViewModel *)getDetailViewModel:(NSInteger)index {
    DetailViewModel *viewModel = [[DetailViewModel alloc] initWithCache:self.imageCache forUrlString:self.data[index]];
    return viewModel;
}
@end
