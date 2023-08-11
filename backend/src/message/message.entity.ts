import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn } from 'typeorm';
import { Dialogue } from '../dialogue/dialogue.entity';

@Entity()
export class Message {
    @PrimaryGeneratedColumn()
    message_id: number;

    @ManyToOne(() => Dialogue, (dialogue) => dialogue.messages, { onDelete: 'CASCADE' })
    @JoinColumn({ name: 'dialogue_id' })
    dialogue: Dialogue;

    @Column()
    sender_email: string;

    @Column('text')
    message_text: string;

    @Column({ default: false })
    is_read: boolean;

    @Column({ type: 'datetime', default: () => 'CURRENT_TIMESTAMP' })
    sending_time: Date;
}