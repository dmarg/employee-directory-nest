import { Position } from './positions.entity';
import { Module } from '@nestjs/common';
import { PositionsService } from './positions.service';
import { PositionsResolver } from './positions.resolver';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([Position])],
  providers: [PositionsService, PositionsResolver]
})
export class PositionsModule {}
