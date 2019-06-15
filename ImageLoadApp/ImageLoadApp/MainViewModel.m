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
@end

@implementation MainViewModel

-(NSArray *)loadData {
    self.data = @[@"https://loremflickr.com/cache/resized/65535_40784877513_e5e40f72df_h_1280_960_nofilter.jpg",
      @"https://loremflickr.com/cache/resized/7892_40394987863_a0e8790e16_h_1280_960_nofilter.jpg",
      @"https://loremflickr.com/cache/resized/65535_32717376537_c4f27c3f0c_320_240_nofilter.jpg",
      @"https://loremflickr.com/cache/resized/5754_20835757549_51a6b2b8c3_h_1280_960_nofilter.jpg",
      @"https://apod.nasa.gov/apod/image/1906/N00172886_92_beltramini.jpg",
      @"https://www.jpl.nasa.gov/spaceimages/images/largesize/PIA23268_hires.jpg",
      @"https://www.jpl.nasa.gov/spaceimages/images/largesize/PIA23273_hires.jpg",
      @"https://www.jpl.nasa.gov/spaceimages/images/largesize/PIA22948_hires.jpg",
      @"https://www.rautomead.com/uploads/images/gallery/1522251890RT650bronzeholows.jpg",
      @"https://loremflickr.com/cache/resized/7890_46965722211_d1bf37288f_320_240_nofilter.jpg",
      @"https://upload.wikimedia.org/wikipedia/commons/3/3d/LARGE_elevation.jpg",
      @"https://fr.wikipedia.org/wiki/Géomorphologie#/media/Fichier:Earth_surface_NGDC_2000.jpg",
      @"https://loremflickr.com/cache/resized/65535_40845344423_d055e8b915_c_500_500_nofilter.jpg",
      @"https://upload.wikimedia.org/wikipedia/commons/1/13/Large_clematis_%28red%29.JPG",
      @"https://upload.wikimedia.org/wikipedia/commons/c/c4/Ferrofluid_large_spikes.jpg",
      @"https://upload.wikimedia.org/wikipedia/commons/4/4e/Mammillaria_prolifera20100407_076.jpg",
      @"https://loremflickr.com/cache/resized/65535_40729969893_482bfe8b05_320_240_nofilter.jpg",
      @"https://loremflickr.com/cache/resized/1495_25243373896_00fa61f4eb_n_320_240_nofilter.jpg",
      @"https://loremflickr.com/cache/resized/7375_9043183128_4803f37b97_320_240_nofilter.jpg",
      @"https://loremflickr.com/cache/resized/7926_47499091882_0a1b1afb0f_320_240_nofilter.jpg",
      @"https://img1.akspic.com/fit/127194-gorodskoj_rajon-chikago-manhetten-metropoliya-zdanie-x750.jpg",
      @"https://img2.akspic.com/fit/18390-zdanie-metropoliya-dnevnoe_vremya-gorodskoj_pejzazh-chikago-x750.jpg",
      @"https://img1.akspic.com/fit/18558-orientir-gorodskoj_rajon-neboskreb-empajr_stejt_bilding-gorodskoj_pejzazh-x750.jpg",
      @"https://upload.wikimedia.org/wikipedia/commons/7/72/Spilanthes-closeup-large.jpg",
      @"https://loremflickr.com/cache/resized/7375_9043183128_4803f37b97_320_240_nofilter.jpg",
      @"https://www.rautomead.com/uploads/images/gallery/1522161415CuMgcoredwire.jpg",
      @"https://www.rautomead.com/uploads/images/gallery/1512388027rautomeadcathodemelting.jpg",
      @"https://www.rautomead.com/uploads/images/gallery/1512123485rautomeadRMTbilletcastingsilverbandsaw.jpg",
      @"https://www.rautomead.com/uploads/images/gallery/1512122971rautomeadRS25008mmbrasswire.jpg",
      @"https://www.rautomead.com/uploads/images/gallery/1512122354rautomeadgoldbondingwirerod99.999.jpg",
      @"https://upload.wikimedia.org/wikipedia/commons/5/5f/Adenium_obesum_%28Kyoto_Botanical_Garden%29.JPG",
      @"https://loremflickr.com/cache/resized/65535_33744143688_3cac5ed48c_320_240_g.jpg",
      @"https://upload.wikimedia.org/wikipedia/commons/1/1f/Bush2.jpg",
      @"https://upload.wikimedia.org/wikipedia/commons/c/c0/Alyxia.oliviformis1web.jpg",
      @"https://upload.wikimedia.org/wikipedia/commons/8/81/Vincetoxicum_nigrum_03_ies.jpg",
      @"https://upload.wikimedia.org/wikipedia/commons/d/dc/Cerbera_odollam.jpg",
      @"https://loremflickr.com/cache/resized/201_442017130_5b94c644c9_320_240_nofilter.jpg",
      @"https://upload.wikimedia.org/wikipedia/commons/4/42/Mimulopsis_violacea%2C_a_characteristic_plant_of_the_upper_forest_in_Equatorial_Africa.jpg",
      @"https://upload.wikimedia.org/wikipedia/commons/a/ac/Systema_Naturae_cover.jpg",
      @"https://upload.wikimedia.org/wikipedia/commons/f/fd/Beli-hibiskus.jpg",
      @"https://img1.akspic.com/fit/48325-sneg-alpy-oblako-zamorazhivanie-gornyj_relef-x750.jpg",
      @"https://img1.akspic.com/fit/127583-vysokij_korabl-korablekrushenie-more-galeon-parusnik-x750.jpg",
      @"https://img1.akspic.com/fit/127533-pervyj_kurs-burya-manilskij_galeon-tryum_polnyj-parusnaya_shlyupka-x750.jpg",
      @"https://img3.akspic.com/fit/93920-brig-brigantina-barka-parusnik-yahta-x750.jpg",
      @"https://img2.akspic.com/fit/125576-elektronnoe_ustrojstvo-tehnologia-microsoft_poverhnost-svet-kabel-x750.jpg",
      @"https://img2.akspic.com/fit/125379-iskusstvo-krug-art-dizajn-vizualnoe_iskusstvo-x750.jpg",
      @"https://loremflickr.com/cache/resized/65535_33744143688_3cac5ed48c_320_240_g.jpg",
      @"https://loremflickr.com/cache/resized/7879_46612728145_91f14bd25c_320_240_g.jpg",
      @"https://img1.akspic.com/fit/125448-macbook-apple_masvook_pro-krasnyj_cvet-tekstura-plamya-x750.jpg",
      @"https://img3.akspic.com/image/3373-koshki-kotenok-porody_sobak-koshki_sfinksy-koshki_i_sobaki-2048x1536.jpg",
      @"https://cdn.eso.org/images/screen/eso1907b.jpg",
      @"https://v-kosmose.com/wp-content/uploads/2015/01/M104_ngc4594_sombrero_galaxy_hi-res.jpg",
      @"https://img2.akspic.com/image/9929-velsh_springer_spaniel-spaniel_klamber-anglijskij_koker_spaniel-anglijskij_springer_spaniel-novoshotlandskij_retriver-2048x1536.jpg",
      @"https://img1.akspic.com/image/78600-amerikanskij_koker_spaniel-pes-porody_gruppy_sobak-zivotnoe-rozhdestvenskij_den-2048x1536.jpg",
      @"https://img2.akspic.com/image/32372-privlekatelnost-meh-morda-usy-kotenok-2048x1536.jpg",
      @"https://img2.akspic.com/image/95406-alyaskinskij_malamut-husky-alyaskinskij_haski-labrador-ezdovaya_sobaka-2048x1536.jpg",
      @"https://img3.akspic.com/image/32308-usy-morda-sobaka-pes-shhenok-2048x1536.jpg",
      @"https://loremflickr.com/cache/resized/7879_32371004727_b45f061741_320_240_nofilter.jpg",
      @"https://loremflickr.com/cache/resized/7871_46491920275_fcc6b968dd_n_320_240_nofilter.jpg",
      @"https://loremflickr.com/cache/resized/65535_47709833542_5efac91d69_320_240_nofilter.jpg"
      ];
    return self.data;
}
@end
